$package = "cloudberrybackup"
$version = "--version=7.0.0.648"
$loops = 5

New-Item -Path "C:\Temp\ChocoCache" -ItemType directory -Force | Out-Null
$cache = "--cacheLocation=C:\Temp\ChocoCache"

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

For ($i=1; $i -lt $loops; $i++) {
    Write-Host "*** Durchlauf $i von $loops ***" -ForegroundColor Red -BackgroundColor White
	choco install $package $version --force
	Start-Sleep 1
	choco uninstall $package
	Start-Sleep 1	
	}