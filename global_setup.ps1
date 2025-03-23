# Install all required python versions

# Run PowerShell in admin mode

# [1] Software
# -----------------------------------------------------------------------

# Chocolatey Package Manager
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco -v

# Create new Alias Profile (Persist alias with reboot)
New-Item -Path $PROFILE.AllUsersAllHosts -Type File -Force
$PROFILE | Select-Object -Property AllUsersAllHosts
	
	
# Non Sucking Service (NSS)
# =======================================================================
choco install nssm --yes
nssm version

# [2] PYTHON VERSIONS
# -----------------------------------------------------------------------
# https://community.chocolatey.org/packages/python#versionhistory


## PYTHON 3.9
## ========================================================================

# Install the specific Python version
choco install python --version=3.9.13 -y # --params '"/InstallDir:C:\Program Files\Python\Python39"'

# Set a PowerShell Alias for this version on the Global Profile
Add-Content -Path $PROFILE.AllUsersAllHosts -Value 'Set-Alias -Name python39 -Value "C:\Python39\python.exe"'
. $PROFILE.AllUsersAllHosts
python39 --version

# Install virtual environment package
python39 -m pip install virtualenv

#  Update PIP
python39 -m pip install --upgrade pip

# Python 3.10
# ========================================================================

# Install the specific Python version
choco install python --version=3.10.11 -y # --params '"/InstallDir:C:\Program Files\Python\Python310"'

# Set a PowerShell Alias for this version
Add-Content -Path $PROFILE.AllUsersAllHosts -Value 'Set-Alias -Name python310 -Value "C:\Python310\python.exe"'
. $PROFILE.AllUsersAllHosts
python310 --version

# Install virtual environment package
python310 -m pip install virtualenv

#  Update PIP
python310 -m pip install --upgrade pip

# [3] R VERSIONS
# -----------------------------------------------------------------------
# https://community.chocolatey.org/packages/R.Project#versionhistory
# Note: Reference R.Project from latest down to oldest in order

# Remove the default R alias so that you can specify the version per application
Remove-Item alias:R -Force

## R 4.4.0
## ========================================================================

choco install r.project --version=4.4.0 --params '"/InstallDir=C:\Program Files\R\R-4.4.0"' -y
Add-Content -Path $PROFILE.AllUsersAllHosts -Value 'Set-Alias -Name r44 -Value "C:\Program Files\R\R-4.4.0\bin\x64\R.exe"'
. $PROFILE.AllUsersAllHosts
r44 --version

## R 3.6.3
## ========================================================================

choco install r.project --allow-downgrade --version=3.6.3 --params '"/InstallDir=C:\Program Files\R\R-3.6.3"' -y
Add-Content -Path $PROFILE.AllUsersAllHosts -Value 'Set-Alias -Name r36 -Value "C:\Program Files\R\R-3.6.3\bin\x64\R.exe"'
. $PROFILE.AllUsersAllHosts
r36 --version



# =========================================================================
# Chocolatey Commands
# =========================================================================

# choco list                                Shows all the installed local packages
# choco uninstall <packageName>             Uninstall a specific local Package


# =========================================================================
# Alias Commands
# =========================================================================
# notepad $PROFILE.AllUsersAllHosts			View the persisted Aliases
# Remove-Item alias:R -Force