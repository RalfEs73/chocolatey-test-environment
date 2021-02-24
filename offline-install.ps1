$gitpackageurl = "https://github.com/RalfEs73/chocolatey-packages/raw/master/anystream/anystream.1.0.9.0.nupkg"
$gitpackage = "anystream.1.0.9.0.nupkg"
$package = "anystream"
$hash = "2D9D5F571162C21A57A2E86B07B5909125163C43DD856A4A12FBF5972C856FA7"

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