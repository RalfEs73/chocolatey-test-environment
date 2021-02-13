$package = "touchportal"
$version = "--version=2.2.005"

For ($i=1; $i -lt 5; $i++) {
	choco install $package $version --force
	Start-Sleep 1
	choco uninstall $package
	Start-Sleep 1	
	}