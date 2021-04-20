#region disclaimer
	#===============================================================================#
	# PowerShell script sample														#
	# Author: Markus Koechl															#
	# Copyright (c) Autodesk 2017													#
	#																				#
	# THIS SCRIPT/CODE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER     #
	# EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES   #
	# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.    #
	#===============================================================================#
#endregion

#region ConnectToVault

		# NOTE - click licensing v5 requires to copy AdskLicensingSDK_5.dll to PowerShell execution folder C:\Windows\System32\WindowsPowerShell\v1.0 before Powershell runtime starts

		[System.Reflection.Assembly]::LoadFrom('C:\Program Files\Autodesk\Autodesk Vault 2021 SDK\bin\x64\Autodesk.Connectivity.WebServices.dll')
		$serverID = New-Object Autodesk.Connectivity.WebServices.ServerIdentities
			$serverID.DataServer = "<ServerName or IP>"
			$serverID.FileServer = "<ServerName or IP>"
		$VaultName = "<Name of Vault>"
		$UserName = "<User Name>"
		$password = "<Password>"
		#Select license type by licensing agent enum "Client" (=Named User) "Server" (= (legacy) Multi-User) or "None" (=readonly access)
		$licenseAgent = [Autodesk.Connectivity.WebServices.LicensingAgent]::Client
		
		$cred = New-Object Autodesk.Connectivity.WebServicesTools.UserPasswordCredentials($serverID, $VaultName, $UserName, $password, $licenseAgent)
		$vault = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager($cred)

		#region ExecuteInVault

				[Autodesk.Connectivity.WebServices.JobParam[]] $params = @()
				$mJobMaxCount = 100
				$mJobStartDate = Get-Date -Day 01 -Month 01 -Year 2010
				$mJobList = $vault.JobService.GetJobsByDate($mJobMaxCount, $mJobStartDate)

				foreach($mJob in $mJobList)
				{
					$params = $mJob.ParamArray
				}
			
		#endregion ExecuteInVault
	
#endregion ConnectToVault

#region DisconnectVault - don't forget ;)
	
		$vaultConnection = $null
		$vault.Dispose()
	
#endregion DisconnectVault