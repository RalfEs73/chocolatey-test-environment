$gitpackageurl = "https://github.com/RalfEs73/chocolatey-packages/raw/master/planetmule/planetmule.1.3.6.nupkg"
$gitpackage = "planetmule.1.3.6.nupkg"
$package = "planetmule"
$hash = "1BB29F9B518C91D7BF9B9FA5F7FCC2455B8C0DD54E9E3A741F39184C00F3F7EE"

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