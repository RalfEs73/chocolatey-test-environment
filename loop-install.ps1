For ($i=1; $i -lt 5; $i++) {
	choco install touchportal --version=2.2.005
	Start-Sleep 1
	choco install untouchportal
	Start-Sleep 1	
	}