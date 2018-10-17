function Set-Gratitude {
    <#
    .Synopsis
        Bot graciously accepts your thanks
    .DESCRIPTION
        Bot graciously accepts your thanks
    .EXAMPLE
        Set-Gratitude
    #>
    
    [PoshBot.BotCommand(
        Command = $false,
        CommandName = 'Set-Gratitude',
        TriggerType = 'regex',
        Regex = "($env:BOTNAME)?(thx|thanks|thank\s+you)\s?($env:BOTNAME)?"
    )]
    [cmdletbinding()]
    Param
    (
        [parameter(ValueFromRemainingArguments = $true)]
        [object[]]$Arguments
    )


    $phrases = (
        "You're welcome",
        "No problem",
        "No prob",
        "np",
        "Sure thing",
        "Anytime, human",
        "Anytime",
        "Anything for you",
        "De nada, amigo",
        "Don't worry about it",
        "My pleasure"
        )

    $punc = (
        " ",
        "!",
        ".",
        "!!",
        " - ",
        ", "
        )

    $emoji = (" ", " ", ":muscle:", ":smile:", ":+1:", ":ok_hand:", ":punch:",
    ":bowtie:", ":smiley:", ":joy_cat:", ":heart:", ":robot_face:",
    ":heartbeat:", ":sparkles:", ":star:", ":star2:", ":smirk:",
    ":grinning:", ":smiley_cat:", ":sunflower:", ":tulip:",
    ":hibiscus:", ":cherry_blossom:", ":ghost:", ":eyes:")

    $resp = "$($phrases | Get-Random)$($punc | Get-Random) $($emoji | Get-Random)"

    return $resp
}

