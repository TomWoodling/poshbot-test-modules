function get-greeting {
    [cmdletbinding()]
[PoshBot.BotCommand(
    CommandName = 'get-greeting',
    Aliases = ('hi', 'hello'),
    Permissions = 'read'
)]
param()

$greetz = @('hi there :bowtie:','good day :sun_with_face:','nice to see you :robot_face:')

$outp = $greetz | Get-Random

Write-Output $outp
}