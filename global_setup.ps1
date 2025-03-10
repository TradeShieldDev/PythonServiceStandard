# Install all required python versions

# Run PowerShell in admin mode

# [1] Software
# -----------------------------------------------------------------------

# Chocolatey Package Manager
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco -v

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
choco install python --version=3.9.13 --params '"/InstallDir:C:\Program Files\Python\Python39"' -y

# Set a PowerShell Alias for this version
$python39path = "C:\Program Files\Python\Python39\python.exe"
Set-Alias python39 $python39path
python39 --version

# Install virtual environment package
python39 -m pip install virtualenv

#  Update PIP
python39 -m pip install --upgrade pip

# Python 3.10
# ========================================================================

# Install the specific Python version
choco install python --version=3.10.11 --params '"/InstallDir:C:\Program Files\Python\Python310"' -y

# Set a PowerShell Alias for this version
$python310path = "C:\Program Files\Python\Python310\python.exe"
Set-Alias python310 $python310path
python310 --version

# Install virtual environment package
python310 -m pip install virtualenv

#  Update PIP
python310 -m pip install --upgrade pip

# [3] R VERSIONS
# -----------------------------------------------------------------------
# https://community.chocolatey.org/packages/R.Project#versionhistory


## R 3.9
## ========================================================================

choco install r.project --version=4.4.0 --params '"/InstallDir=C:\Program Files\R\R-4.4"' 
$r44path = "C:\Program Files\R\R-4.4\bin\x64\R.exe"
Set-Alias r44 $r44path
r44 --version

## R 3.6.3
## ========================================================================

choco install r.project --version=3.6.3 --params '"/InstallDir=C:\Program Files\R\R-3.6"' 
$r36path = "C:\Program Files\R\R-3.6\bin\x64\R.exe"
Set-Alias r363 $r36path
r36 --version


