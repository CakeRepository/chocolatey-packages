﻿$ErrorActionPreference = 'Stop'
$packageName = 'copy-dialog-lunar-lander'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$toolsDir    		= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$Shortcut    		= 'Copy Dialog Lunar Lander.lnk'
$ProgramEXE  		= 'CopyDialogLunarLander.exe'
$checksum_file	    = 'ACD1B6090D875F7E3EB107E0EBDE337F1DDF12373E57E8680E904D724565DFCA'
$checksumType_file	= 'sha256'

$packageArgs = @{
    PackageName    = $packageName
    FileFullPath   = "$toolsPath\copy-dialog-lunar-lander-v1.0.zip"
    Destination    = $toolsDir
}

Get-ChocolateyWebFile -Checksum $checksum_file -ChecksumType $checksumType_file -PackageName 'copy-dialog-lunar-lander' -FileFullPath "$toolsPath\copy-dialog-lunar-lander-v1.0.zip" -Url 'https://github.com/Sanakan8472/copy-dialog-lunar-lander/releases/download/v1.0/copy-dialog-lunar-lander-v1.0.zip'
Get-ChocolateyUnzip @packageArgs

Install-ChocolateyShortcut -shortcutFilePath "$env:Public\Desktop\$Shortcut" -targetPath "$toolsDir\copy-dialog-lunar-lander\$ProgramEXE" -WorkingDirectory "$toolsDir"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$Shortcut" -targetPath "$toolsDir\copy-dialog-lunar-lander\$ProgramEXE"    
