# iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/RalfEs73/chocolatey-test-environment/raw/main/test-install.ps1'))
New-Item -Path "C:\Temp\ChocoCache" -ItemType directory -Force | Out-Null
$cache = "--cacheLocation=C:\Temp\ChocoCache"

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

Start-BitsTransfer -Source "https://github.com/RalfEs73/chocolatey-test-environment/raw/main/loop-install.ps1" -Destination "C:\Users\$CurrentUserName\Desktop\loop-install.ps1"
Start-BitsTransfer -Source "https://github.com/RalfEs73/chocolatey-test-environment/raw/main/offline-install.ps1" -Destination "C:\Users\$CurrentUserName\Desktop\offline-install.ps1"

Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install chocolatey-core.extension -y $cache
choco feature enable --name=allowGlobalConfirmation
choco feature enable -n=useRememberedArgumentsForUpgrades
Write-Host "Done"
