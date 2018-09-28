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