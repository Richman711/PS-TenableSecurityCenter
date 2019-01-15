# Current information about Tenable REST api see:
# https://docs.tenable.com/sccv/api/index.html

if (Test-Path variable:SecurityCenter) {
    Remove-Variable SecurityCenter
}

New-Variable -Name SecurityCenter `
             -Value ( New-Object psobject -Property @{ Uri = "";
                                                       Session = $null;
                                                       Token = $null;
                                                       User = $null; 
                                                       } ) `
             -Scope Global

$SecurityCenter | Add-Member -MemberType ScriptMethod -Name NewPKISession -Value {
    param ([string]$SystemCenterUri,
          [System.Security.Cryptography.X509Certificates.X509Certificate]$Certificate)  

    try {
            $SystemInit = Invoke-RestMethod -Uri $SystemCenterUri"/rest/system" -Method Get -Certificate $Certificate `
                        -SessionVariable WebSession
    
    } catch {
        Write-Debug "Flushdns"
        Invoke-Command -ScriptBlock { ipconfig.exe /flushdns }
        Write-Debug "Purges and reloads the remote cache name table"
        Invoke-Command -scriptblock { nbtstat.exe -R }
        Write-Debug "Kerberos list purge"
        Invoke-Command -ScriptBlock { klist.exe purge }
        throw $_
    }

    $this.Uri = $SystemCenterUri+"/rest"          
    $this.Session = $WebSession
    $this.Token = $SystemInit.response.token

    #places the user token in the session header so it wont be needed in future requests with this session
    $this.User = (Invoke-RestMethod -Uri ($this.Uri+"/currentUser") -Method Get -Headers @{"X-SecurityCenter"=$this.Token} `
               -WebSession $this.Session ).response.username


}
