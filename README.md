# VDS-Configuration-Editor

Efficiently edit and extend Vault Data Standard Configurations using this Visual Studio Solution; the solution contains several projects:

- Vault-API-ScriptEditor: PowerShell Project referencing Vault 2021 SDK version; use this to explore Vault API quickly by scripting.
	It includes multiple samples to search files, assign files to items, creating items, etc..
	Copy the .\Vault-API-ScriptEditor\Vault-API-Sample-Template.ps1 to start your individual script.

- VDS_SnippetsAndTemplates: frequently used powershell and some XAML code snippets to be copied or directly added to your 
	Visual Studio -> Tools\Code Snippet Manager.

WPF type projects linking the default (program's installed configuration) and Quickstart (Autodesk Technical Sales EMEA issued Sample) configuration of VDS; VDS 2021 has to be installed though. 
	VDS-2021-ConfigLinks-Default: Links all default configuration files; copy files to .\Custom\* tree before editing and link to the projects .\Custom folder respectively.
	VDS-2021-Quickstart-Standard: Edit the configuration sample available for download here: https://github.com/koechlm/VDS-2021-Quickstart/releases/latest
	VDS-2021-Quickstart-Advanced: Edit work-in-progress branch(es) *Advanced* selected from main repository: https://github.com/koechlm/VDS-2021-Quickstart


Last but not least, the solution's disclaimer applies to any code and template, even if not added explicitly as a header.

Respectfully,

Markus Koechl, 	Solutions Engineer PDM|PLM - Autodesk Central Europe
