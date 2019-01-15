# PS-TenableSecurityCenter
Powershell plugin to directly interface with the Tenable Security Center 5.6.X via the documented REST api <https://docs.tenable.com/sccv/api/index.html>

On this inital implimentaion I've only added support for PKI certificated via a hardtoken/local store or 
you can pass in your own X509 certificate.

I plan to add more of the basic API funtions on top of packaging it up in a .psm1 and creating a .psd1 to
complement the functions.

NOTE:

Please know that these scripts are "AS IS" and I offer no support nor assume any liability if you use them in
your environment.
