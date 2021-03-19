$package = "planetmule"
$version = "1.3.6"
$hash = "BACB18AAE87B6FCC7BE42CF579D078DE6C7E58171A668EBADF01DEBEE0AC7C8F"

$gitpackage = $package + "." + $version + ".nupkg"
$gitpackageurl = "https://github.com/RalfEs73/chocolatey-packages/raw/master/" + $package + "/" + $gitpackage
$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Start-BitsTransfer -Source $gitpackageurl -Destination $gitpackage

if((Get-FileHash $gitpackage).hash -ne $hash)
    {
    Write-Host "Falsche Packet Version"
    del $gitpackage
    }
    else
    {
    choco install $package -s . -force
    del $gitpackage
    Write-Host "Done"
    choco uninstall $package
    Write-Host "Done"
    }