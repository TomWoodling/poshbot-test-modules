#
# Module manifest for module 'PSGet_Builtin'
#
# Generated by: Brandon Olin
#
# Generated on: 5/11/2017
#
# Amended on 31/8/2018 to test adding extra
# built-in functions by me (TW)

@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'Builtin.psm1'
    
    # Version number of this module.
    ModuleVersion = '0.10.1'
    
    # Supported PSEditions
    # CompatiblePSEditions = @()
    
    # ID used to uniquely identify this module
    GUID = '1306359e-0502-4db4-8ce0-3f3d46f83b8a'
    
    # Author of this module
    Author = 'Brandon Olin'
    
    # Company or vendor of this module
    CompanyName = 'Community'
    
    # Copyright statement for this module
    Copyright = '(c) 2018 Brandon Olin. All rights reserved.'
    
    # Description of the functionality provided by this module
    Description = 'Builtin PoshBot commands'
    
    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.0.0'
    
    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''
    
    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''
    
    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''
    
    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''
    
    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''
    
    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules = @('PoshBot')
    
    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()
    
    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()
    
    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()
    
    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()
    
    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()
    
    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = 'About', 'Add-CommandPermission', 'Add-GroupRole', 'Add-GroupUser',
                   'Add-RolePermission', 'Disable-Plugin', 'Enable-Plugin', 'Find-Plugin',
                   'Get-CommandHistory', 'Get-Group', 'Get-Permission', 'Get-Plugin',
                   'Get-Role', 'Get-CommandHelp', 'Install-Plugin', 'New-Group', 'New-Permission',
                   'New-Role', 'Remove-Group', 'Remove-GroupRole', 'Remove-GroupUser',
                   'Remove-Plugin', 'Remove-Role', 'Remove-RolePermission', 'Slap', 'Get-PoshBotStatus',
                   'Update-GroupDescription', 'Update-RoleDescription', 'Get-ScheduledCommand',
                   'New-ScheduledCommand', 'Set-ScheduledCommand', 'Remove-ScheduledCommand',
                   'Enable-ScheduledCommand', 'Disable-ScheduledCommand', 'Update-Plugin', 'Get-CommandStatus',
                   'Approve-PendingCommand', 'Deny-PendingCommand', 'Get-PendingCommand', 'Get-CatPic', 'Get-Greeting',
                   'Get-PicDesc', 'Get-ADGrpMemBot', 'Get-ADDirectRepsBot', 'Get-ADGroupsForUserBot', 'Get-ADNestedGroupsBot',
                   'Search-ADGroups'
    
    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()
    
    # Variables to export from this module
    VariablesToExport = @()
    
    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()
    
    # DSC resources to export from this module
    # DscResourcesToExport = @()
    
    # List of all modules packaged with this module
    # ModuleList = @()
    
    # List of all files packaged with this module
    # FileList = @()
    
    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
    
            # Define the set of permissions exposed by this module
        Permissions = @(
            @{
                Name = 'show-help'
                Description = 'Can display help about commands'
            }
            @{
                Name = 'view'
                Description = 'Can display details about running bot instance'
            }
            @{
                Name = 'view-role'
                Description = 'Can view details about roles defined in bot'
            }
            @{
                Name = 'view-group'
                Description = 'Can view details about groups defined in bot'
            }
            @{
                Name = 'manage-groups'
                Description = 'Can create/update/delete groups'
            }
            @{
                Name = 'manage-roles'
                Description = 'Can create/update/delete roles'
            }
            @{
                Name = 'manage-permissions'
                Descirption = 'Can create/update/delete permissions'
            }
            @{
                Name = 'manage-plugins'
                Description = 'Can install/enable/disable plugins'
            }
            @{
                Name = 'manage-schedules'
                Description = 'Can manage scheduled commands'
            }
        )
    
        PSData = @{
    
            # Tags applied to this module. These help with module discovery in online galleries.
            # Tags = @()
    
            # A URL to the license for this module.
            # LicenseUri = ''
    
            # A URL to the main website for this project.
            # ProjectUri = ''
    
            # A URL to an icon representing this module.
            # IconUri = ''
    
            # ReleaseNotes of this module
            ReleaseNotes = '
    ## [0.6.2] - 2017-08-10
    ### Changed
    - Added Slap command, to slap someone around a bit with a large trout
            '
    
            # External dependent modules of this module
            # ExternalModuleDependencies = ''
    
        } # End of PSData hashtable
    
    } # End of PrivateData hashtable
    
    # HelpInfo URI of this module
    # HelpInfoURI = ''
    
    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
    
    }
    