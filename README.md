## PoorSQL.com Website Repository

This repository hosts the source code for the http://poorsql.com online (and offline) T-SQL Formatting Tool.

This in turn uses the Poor Man's T-SQL Formatter Library (originally .Net and transpiled to JS).

The site code is hosted in the "docs" folder, and this root folder contains utilities such as the VBS script AppCache-manifest-generation script, and the lightweight mongoose HTTP server for local (on windows) testing of functionality that cannot be accessed with the "file:///" URI scheme - such as AppCache and Web Workers.

This site is released under the Affero GPL license.

### Issues

Please report any site-specific issues here (https://github.com/TaoK/poorsql.com/issues), and report any library-general issues in that project: https://github.com/TaoK/PoorMansTSqlFormatter/issues

### News

To keep up with any news related to the site or library, follow [@PoorSQL](https://twitter.com/PoorSQL) on Twitter.

### Credits

Third-party code used in site functionality:
* Poor Man's T-SQL Formatter 
* Bridge.Net - Apache license - Object.NET
* jQuery - MIT license - John Resig
* jQuery Serialize plugin (modified) - unknown license - Thomas Danemar
* jquery.deserialize plugin - unknown license - Israel Tsadok
* jQuery JSONP plugin - MIT license - Julian Aubourg
* JQuery URL Parser plugin - unlicense license - Mark Perkins
* jQuery Cookie plugin - MIT license - Klaus Hartl
* jQuery BASE64 functions - GPL license - Muhammad Hussein Fattahizadeh
* jquery-localize plugin (modified) - MIT license - Jim Garvin

Credits - third-party tools used and included in repo:
* Mongoose HTTP Server - GPLv2 license - Cesanta
