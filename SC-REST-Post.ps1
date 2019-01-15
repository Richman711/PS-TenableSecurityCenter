<#
Covers POST methods for:
    rest/analysis
    rest/analysis/download

#>

function Post-SCAnalysis 
{ #https://docs.tenable.com/sccv/api/Analysis.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        $body
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/analysis") -Method Post `
            -Body $body -WebSession $SecurityCenter.Session -UseBasicParsing
    }


}#End Get-SCAnalysis

function Post-SCAnalysisDL 
{ #https://docs.tenable.com/sccv/api/Analysis.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        $body
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/analysis/download") -Method Post `
            -Body $body -WebSession $SecurityCenter.Session -UseBasicParsing
    }


}#End Get-SCAnalysisDL
