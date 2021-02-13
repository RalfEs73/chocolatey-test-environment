$package = "choco install cloudberrybackup --version=7.0.0.648"

For ($i=1; $i -lt 5; $i++) {
	choco install $package
	Start-Sleep 1
	choco install $package
	Start-Sleep 1	
	}