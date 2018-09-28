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