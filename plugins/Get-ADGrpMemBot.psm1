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
Add-Type @"
    public class DynParamQuotedString {

        public DynParamQuotedString(string quotedString) : this(quotedString, "'") {}
        public DynParamQuotedString(string quotedString, string quoteCharacter) {
            OriginalString = quotedString;
            _quoteCharacter = quoteCharacter;
        }

        public string OriginalString { get; set; }
        string _quoteCharacter;

        public override string ToString() {
            if (OriginalString.Contains(" ")) {
                return string.Format("{1}{0}{1}", OriginalString, _quoteCharacter);
            }
            else {
                return OriginalString;
            }
        }
    }
"@


    #Get details for snippet
    $path="$env:BOTROOT\csv\"
    $title = "$($Group.Replace(' ','_')).csv"

    # Create a hashtable for the results
    $result = @{}
    
    $birp = noquotez -bloop $group

if ($birp -match ' ') {
$scurp = @"
Get-ADGroupMember -ErrorAction Stop -Identity '$birp' -Recursive | select name,samaccountname
"@
}
else {
$scurp = @"
Get-ADGroupMember -ErrorAction Stop -Identity $birp -Recursive | select name,samaccountname
"@
}
$scump = [Scriptblock]::Create($scurp)

return $scump

}
  <#  try {
        # Use ErrorAction Stop to make sure we can catch any errors
        $membs = Invoke-Command -ScriptBlock $scump
        if ($membs) { 
            $membs | Export-Csv -Path "$path\$title" -Force -NoTypeInformation
            New-PoshBotFileUpload -Path "$path\$title" -Title $title -DM
            $result.output = "Request for $Group processed - results sent as a DM :bowtie:"
            }
        else {$result.output = "No results returned :bowtie:"}
        
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
    return $result.output
  
}

    #>  