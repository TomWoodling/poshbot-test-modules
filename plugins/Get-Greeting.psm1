function Get-Greeting {
    [cmdletbinding()]
[PoshBot.BotCommand(
    CommandName = 'Get-Greeting',
    Aliases = ('hi', 'hello'),
    Permissions = 'read'
)]
param(
    [parameter(Mandatory)]
    $Bot
)

$greetz = @('hi there :bowtie:','good day :sun_with_face:','nice to see you :robot_face:','yo :')

$outp = $greetz | Get-Random

Write-Output $outp
}