<#
Covers GET methods for:
    rest/user
    rest/user/id

    rest/asset
    rest/asset/{id}
    rest/asset/{id}/export
    rest/asset/tag

#>

function Get-SCUsers 
{ #https://docs.tenable.com/sccv/api/User.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/user"+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }

}#End Get-SCUsers

function Get-SCUserID 
{ #https://docs.tenable.com/sccv/api/User.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        $id,
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/user/"+$id+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }

}#End Get-SCUserID


function Get-SCAsset
{ #https://docs.tenable.com/sccv/api/Asset.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/asset"+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }

}#End Get-SCAsset

function Get-SCAssetID 
{ #https://docs.tenable.com/sccv/api/Asset.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        $id,
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/asset/"+$id+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }

}#End Get-SCAssetID

function Get-SCAssetIDExport 
{ #https://docs.tenable.com/sccv/api/Asset.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        $id
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/asset/"+$id+"/export") -Method Get `
            -WebSession $SecurityCenter.Session
    }

}#End Get-SCAssetIDExport

function Get-SCAssetTag 
{ #https://docs.tenable.com/sccv/api/Asset.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/asset/tag") -Method Get `
            -WebSession $SecurityCenter.Session
    }

}#End Get-SCAssetTag
