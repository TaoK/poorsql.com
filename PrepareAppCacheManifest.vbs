Const startFolderPath = "docs"
Const outFilePath = "manifest.appcache"
Const cacheFilePrefix = "CACHE MANIFEST"
Const networkSectionPrefix = "NETWORK:"

Set badExtensionsRegex = New RegExp
badExtensionsRegex.Pattern = "((CNAME)|(\.(asmx|config|dll|appcache)))$"
badExtensionsRegex.IgnoreCase = True

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set startFolderInfo = objFSO.GetFolder(startFolderPath)
Set outFile = objFSO.CreateTextFile(startFolderPath + "\" + outFilePath, True, False) ' Overwrite, Not Unicode

outFile.WriteLine cacheFilePrefix
outFile.WriteLine

finalHash = ProcessPathHierarchy(outFile, badExtensionsRegex, startFolderInfo, "")

outFile.WriteLine
outFile.WriteLine networkSectionPrefix
outFile.WriteLine "*"
outFile.WriteLine
outFile.WriteLine "#" + finalHash

Set outFile = Nothing
Set startFolderInfo = Nothing
Set objFSO = Nothing

'BadBad programming - printing side-effects to hash calculation.
Function ProcessPathHierarchy (fileObject, extensionsRegex, folderInfoObject, priorPath)
  Dim hashString
  For Each fileInfoObject In folderInfoObject.Files
    If Not extensionsRegex.Test(fileInfoObject.Name) Then
      fileObject.WriteLine priorPath + fileInfoObject.Name
      hashString = hashString + md5(fileInfoObject.Path)
    End If
  Next
  For Each subFolderInfoObject In folderInfoObject.SubFolders
    hashString = hashString + ProcessPathHierarchy(fileObject, extensionsRegex, subFolderInfoObject, priorPath + subFolderInfoObject.Name + "/")
  Next
  ProcessPathHierarchy = hashString
End Function


'From StackOverflow: https://stackoverflow.com/questions/36276677/generating-the-hash-value-of-a-file
Function md5(filename)
  Dim MSXML, EL, MD5Obj
  Set MD5Obj = CreateObject("System.Security.Cryptography.MD5CryptoServiceProvider")
  MD5Obj.ComputeHash_2(readBinaryFile(filename))
  Set MSXML = CreateObject("MSXML2.DOMDocument")
  Set EL = MSXML.CreateElement("tmp")
  EL.DataType = "bin.hex"
  EL.NodeTypedValue = MD5Obj.Hash
  md5 = EL.Text
End Function

'From StackOverflow: https://stackoverflow.com/questions/36276677/generating-the-hash-value-of-a-file
Function readBinaryFile(filename)
  Const adTypeBinary = 1
  Dim objStream
  Set objStream = CreateObject("ADODB.Stream")
  objStream.Type = adTypeBinary
  objStream.Open
  objStream.LoadFromFile filename
  readBinaryFile = objStream.Read
  objStream.Close
  Set objStream = Nothing
End Function

