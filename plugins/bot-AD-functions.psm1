function Get-ADGrpMemBot {
<#
.Synopsis
    Ad group members query for ad_bot
.DESCRIPTION
    Ad group members query
.EXAMPLE
    Get-ADGroupMemberBot.ps1 -group 'SG-ITS-Ops'
#>

[CmdletBinding()]
[PoshBot.BotCommand(
    CommandName = 'Get-ADGrpMemBot',
    Aliases = ('get-members', 'adgrpmems','adgroup'),
    Permissions = 'read'
)]
Param
(
    $bot,
    # Name of the Service
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Group
)

#Get details for snippet
$path="$env:BOTROOT\$($Group.Replace(' ','_')).csv"


# Create a hashtable for the results
$result = @{}

try {
    # Use ErrorAction Stop to make sure we can catch any errors
    Get-ADGroupMember -ErrorAction Stop -Identity "$Group" -Recursive | select name,samaccountname | Export-Csv -Path $path -Force -NoTypeInformation
    
    New-PoshBotFileUpload -Path $path -Title "$($Group.Replace(' ','_')).csv" -DM
    # Create a string for sending back to slack. * and ` are used to make the output look nice in Slack. Details: http://bit.ly/MHSlackFormat
    $result.output = "Request for $Group processed - results sent as a DM :bowtie:"
    #Write-Output "Processing request now..."
    
    # Set a successful result
    $result.success = $true
    }
catch {
    # If this script fails we can try to match the name instead to see if we get any suggestions
    $cloo = Get-ADGroup -Filter * -Properties name,samaccountname | where name -Match $group | select -ExpandProperty name
    if($cloo.Count -ge 1) {
        $clee = [system.string]::join("; ", $cloo)
        $clib = ", you could try $clee"
        }
    else {$clib = ':cold_sweat:'}
    $result.output = "Group $Group does not exist$clib"
    
    # Set a failed result
    $result.success = $false
    }
Remove-Item -Path $path -Force
return $result.output
}


function Get-ADDirectRepsBot {
<#
.Synopsis
    Gets direct reports in AD.
.DESCRIPTION
    Gets direct reports in AD
.EXAMPLE
    Get-ADDirectRepsBot -User a.testname
#>

[CmdletBinding()]
[PoshBot.BotCommand(
    CommandName = 'Get-ADDirectRepsBot',
    Aliases = ('get-directreps', 'direct-reps', 'reports-to'),
    Permissions = 'read'
)]
Param
(
    # Name of the Service
    $bot,
    [Parameter(Mandatory=$true, Position=0)]
    [string]$User
)

#Get details for snippet
$path="C:\ps\ADDR_Results_for_$($User.Replace('.','_')).csv"


# Create a hashtable for the results
$result = @{}

try {
    # Use ErrorAction Stop to make sure we can catch any errors
    Get-ADDirectReports -Identity $user -Recurse | Export-Csv -Path $path -Force -NoTypeInformation
    
    New-PoshBotFileUpload -Path $path -Title "ADDR_Results_for_$($User.Replace('.','_')).csv" -DM

    # Set a successful result
    $result.success = $true

    $result.output = "I have sent the results as a DM :bowtie:"
    }
catch {
    # If this script fails we can try to match the name instead to see if we get any suggestions
    $result.output = "$User does not exist :cold_sweat:"
    
    # Set a failed result
    $result.success = $false
    }
# Return the result and convert it to json, then attach a snippet with the results
Remove-Item -Path $path -Force
return $result.output
}


Get-ADGroupsForUserBot {
<#
.Synopsis
    Gets AD Groups for username.
.DESCRIPTION
    Gets AD Groups for username.
.EXAMPLE
    Get-ADGroupsForUserBot.ps1 -username t.woodling
#>

[CmdletBinding()]
[PoshBot.BotCommand(
    CommandName = 'Get-ADGroupsForUserBot',
    Aliases = ('get-usergroups', 'groups4user', 'membership'),
    Permissions = 'read'
)]
Param
(
    $bot,
    [Parameter(Mandatory=$true, Position=0)]
    [string]$User
)

#Get details for snippet
$path="C:\ps\Results_for_$($User.Replace('.','_')).csv"


# Create a hashtable for the results
$result = @{}

try {
    # Use ErrorAction Stop to make sure we can catch any errors
    $groups = Get-UserGroupMembershipRecursive -UserName "$User"
    $groups.memberof | select name | Export-Csv -Path $path -Force -NoTypeInformation

    if ($groups) {
    # Set a successful result
    $result.success = $true

    $result.output = "I have sent the results as a DM :bowtie:"        
    New-PoshBotFileUpload -Path $path -Title "Membership_for_$($User.Replace('.','_')).csv" -DM
    Remove-Item -Path $path -Force
    }
    else {$result.output = "No results for $user :crying_cat_face:"        }
    }
catch {

    $clib = ':cold_sweat:'
    $result.output = "I cannot get details for $User $clib"
    
    # Set a failed result
    $result.success = $false
    }
# Return the result and convert it to json, then attach a snippet with the results


return $result.output
}

Get-ADNestedGroupsBot {
    <#
.Synopsis
    Gets service status for Hubot Script.
.DESCRIPTION
    Gets service status for Hubot Script.
.EXAMPLE
    Get-ServiceHubot -Name dhcp
#>

[CmdletBinding()]
[PoshBot.BotCommand(
    CommandName = 'Get-ADNestedGroupsBot',
    Aliases = ('get-nestedgroups', 'groups-in'),
    Permissions = 'read'
)]
Param
(
    $bot,
    # Name of the Service
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Group
)

#Get details for snippet
$path="C:\ps\$($Group.Replace(' ','_')).csv"


# Create a hashtable for the results
$result = @{}

try {
    # Use ErrorAction Stop to make sure we can catch any errors
    Get-ADNestedGroups -GroupName $Group -ErrorAction stop | select name | Export-Csv -Path $path -Force -NoTypeInformation
    
    # Create a string for sending back to slack. * and ` are used to make the output look nice in Slack. Details: http://bit.ly/MHSlackFormat
    $result.output = ":kuribo: Request for $Group processed..."
    #Write-Output "Processing request now..."
    
    # Set a successful result
    $result.success = $true
    }
catch {
    # If this script fails we can try to match the name instead to see if we get any suggestions
    $cloo = Get-ADGroup -Filter * -Properties name,samaccountname | where name -Match $group | select -ExpandProperty name
    if($cloo.Count -ge 1) {
        $clee = [system.string]::join("; ", $cloo)
        $clib = ", you could try $clee"
        }
    else {$clib = ':mariofail:'}
    $result.output = "Group $Group does not exist$clib"
    
    # Set a failed result
    $result.success = $false
    }
# Return the result and convert it to json, then attach a snippet with the results
New-PoshBotFileUpload -Path $path -Title "Nested_Groups_In_$($Group.Replace(' ','_')).csv" -DM
Remove-Item -Path $path -Force
return $result.output
}