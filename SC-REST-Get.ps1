<#
Covers GET methods for:
    rest/user
    rest/user/id

    rest/asset
    rest/asset/{id}
    rest/asset/{id}/export
    rest/asset/tag

    rest/deviceInfo

    rest/ipInfo ##This function has been DEPRECATED as of SecurityCenter 5.7.0.##

    rest/configSection #Admins only#
    rest/configSection/{id} #Admins only#

    rest/pubSite

    rest/notification
    rest/notification/{id}

    rest/repository
    rest/repository/{id}

    rest/status
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
########################################################

function Get-SCDeviceInfo
{ #https://docs.tenable.com/sccv/api/Device-Information.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Position=1)]
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/deviceInfo"+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCDeviceInfo

function Get-SCipInfo
{ #https://docs.tenable.com/sccv/api/IP-Information.html

 ###############################################################################################################
<#This function has been DEPRECATED as of SecurityCenter 5.7.0. Relying on this function is highly discouraged.#>
 #See /deviceInfo::GET                                                                                         #
 ###############################################################################################################
 

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Mandatory=$true,
                   Position=1)]
        $fields #?fields=<field>,...
    )
    BEGIN
    {
        Write-Warning "This function has been DEPRECATED as of SecurityCenter 5.7.0. Relying on this function is highly discouraged." 
        Write-Warning "See /deviceInfo::GET"
    }

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/ipInfo"+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCipInfo

function Get-SCConfigSection #Admins only#
{ #https://docs.tenable.com/sccv/api/Configuration-Section.html

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
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/configSection") -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCConfigSection

function Get-SCConfigSectionID #Admins only#
{ #https://docs.tenable.com/sccv/api/Configuration-Section.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Mandatory=$true,
                   Position=1)]
        $id
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/configSection/"+$id) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCConfigSectionID

function Get-SCPubSite
{ #https://docs.tenable.com/sccv/api/Publishing-Site.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Position=1)]
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/pubSite"+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCPubSite

function Get-SCNotification
{ #https://docs.tenable.com/sccv/api/Notification.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Position=1)]
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/notification"+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCNotification

function Get-SCNotificationID
{ #https://docs.tenable.com/sccv/api/Notification.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Mandatory=$true,
                   Position=1)]
        $id,
        [Parameter(Position=2)]
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/notification/"+$id+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCNotificationID

function Get-SCRepository
{ #https://docs.tenable.com/sccv/api/Repository.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Position=1)]
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/repository"+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCRepository

function Get-SCRepositoryID
{ #https://docs.tenable.com/sccv/api/Repository.html

    [CmdletBinding()]
    Param 
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SecurityCenter,
        [Parameter(Mandatory=$true,
                   Position=1)]
        $id,
        [Parameter(Position=2)]
        $fields #?fields=<field>,...
    )

    Process 
    {
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/repository/"+$id+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCRepositoryID

function Get-SCStatus 
{ #https://docs.tenable.com/sccv/api/Status.html

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
        return Invoke-RestMethod -Uri ($SecurityCenter.Uri+"/status"+$fields) -Method Get `
            -WebSession $SecurityCenter.Session
    }
    
}#End Get-SCStatus
