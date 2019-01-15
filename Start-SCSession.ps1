function Start-SCSession 
{
    <#
    .Synopsis
        Submits user certificate to SecurityCenter for a web session.
    .DESCRIPTION
        The Certificate provided will be used for the current web session with the Security Center server.
        The SecurityCenter object should should be loaded into the powershell session when the SecurityCenter
         is imported.
    .EXAMPLE
        Start-SCSession -SecurityCenter $SecurityCenter -SecurityCenterUri "https://hostname"

        The typical use case is to provide the SecurityCenter session object and the target Securiy Center host.

    .EXAMPLE
        Start-SCession -SecurityCenter $SecurityCenter -SecurityCenteruri "https://hostname" -Certificate $Cert

        This is a way to provide X509 certificate in the initial call.
    #>

    [cmdletbinding()]
    Param
    (
        [Parameter(ValuefromPipeline=$false,
                    Mandatory =$true)]
        $SecurityCenter,
        [Parameter(Mandatory=$true)]
        $SecurityCenterUri,
        [System.Security.Cryptography.X509Certificates.X509Certificate]$Certificate
    )

    PROCESS 
    {
        if($Certificate -eq $null)
        {
            Add-Type -AssemblyName System.Security
            $ValidCerts = [System.Security.Cryptography.X509Certificates.X509Certificate2[]](Get-ChildItem 'Cert:\CurrentUser\My')
            $cert = [System.Security.Cryptography.X509Certificates.X509Certificate2UI]::SelectFromCollection($ValidCerts, `
                  'Choose a certificate', 'Choose a certificate', 0)
            $myCertNumber = $cert[0].Thumbprint
            $Certificate = Get-ChildItem -Path Cert:\CurrentUser\My\$myCertNumber
            $SecurityCenter.NewPKISession($SecurityCenterUri,$Certificate)
        }
        else
        {
            $SecurityCenter.NewPKISession($SecurityCenterUri,$Certificate)
        }
    }

}#End Start-SCSession
