﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Chia-Network/chia-blockchain/releases/download/1.1.7/ChiaSetup-1.1.7.exe'
$process	= "Chia"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'chia-network*'

  checksum      = '0A51BA5BCBAC7E2FE4C05F17CFAE6037A32C493D806643F30B9EEF9370178577'
  checksumType  = 'sha256'

  silentArgs   = '/S'
}

$CheckProcess = Get-Process | Where-Object {$_.ProcessName -eq $process}
If($CheckProcess -eq $null){
	Write-Host "Prozess wird aktuell nicht ausgeführt"
	} 
	else {
	Write-Host "Prozess wird aktuell ausgeführt"
    Stop-Process -Name $process
	}

Install-ChocolateyPackage @packageArgs
