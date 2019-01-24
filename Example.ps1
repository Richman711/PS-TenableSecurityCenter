. \\hostname\**\PowerShell\Security-Center\SC-RESTsessionVariable.ps1

. \\hostname\**\PowerShell\Security-Center\SC-REST-Get.ps1

. \\hostname\**\PowerShell\Security-Center\SC-REST-Post.ps1

. \\hostname\**\PowerShell\Security-Center\SC-REST-Start.ps1

Start-SCSession -SecurityCenter $SecurityCenter -SecurityCenterUri "https://hostname.xxx.xxxxx" #Enter the SC URL here

    #IP Summary 
    #Q: Querey Name obtained from SC (look at view to find Query ID)
    $query=@{

    "type"= "vuln";


    "query"= @{ "id" = "#####" # Enter the Query ID here
        }

    "sortDir"= "ASC";

    "sortField"= "ip";

    "sourceType"= "cumulative";

    }

    $body = ConvertTo-Json($query) -Depth 5

    $Responce = Post-SCAnalysis $SecurityCenter -body $body

    $Responce.response.results[1]

    $Responce.response.results[1].repository






Function pause ($message)
{
    # Check if running Powershell ISE
    if ($psISE)
    {
         Write-Host  '********************************************'
    }
    else
    {
        Write-Host -NoNewLine 'Press any key to continue...';
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    }
}
pause
