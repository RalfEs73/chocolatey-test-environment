$gitpackageurl = "https://github.com/RalfEs73/chocolatey-packages/raw/master/filminfo/filminfo.0.6.1.3.nupkg"
$gitpackage = "filminfo.0.6.1.3.nupkg"
$package = "filminfo"

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Start-BitsTransfer -Source $gitpackageurl -Destination $gitpackage
choco install $package -s .
del $gitpackage
Write-Host "Done"