﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# $url64      = 'https://github.com/LedgerHQ/ledger-live-desktop/releases/download/v2.42.0/ledger-live-desktop-2.42.0-win-x64.exe'
$url64      = 'https://download.live.ledger.com/ledger-live-desktop-2.49.2-win-x64.exe'


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'ledger-live*'
  checksum64    = '665A7955ACAC695E0C01C646B49A403DA9615145AF20EA6B867DA1C538972BBB'
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

