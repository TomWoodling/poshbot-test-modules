function Get-TestCSV {
    [CmdletBinding()]
    [PoshBot.BotCommand(
        CommandName = 'Get-TestCSV',
        Aliases = ('test-me', 'csv-me'),
        Permissions = 'read'
    )]
    Param
    (
        # Name of the Service
        $bot,
        [Parameter(Position=0)]
        [string]$Service="*CP*"
    )


    

    # Create a hashtable for the results
    $result = @{}

    try {
        $bips = Get-Service | where servicename -like "$service"
        
        $bips | Export-Csv -NoTypeInformation "$env:BOTROOT\test.csv" -Force

        New-PoshBotFileUpload -Path "$env:BOTROOT\test.csv" -Title 'testing.csv' -DM

        # Set a successful result
        $result.success = $true

        $result.output = "I have sent the results as a DM"
        }
    catch {

        $clib = ':cold_sweat:'
        $result.output = "I cannot get details for this $clib"
        
        # Set a failed result
        $result.success = $false
        }
    # Return the result and convert it to json, then attach a snippet with the results


    return $result.output

}