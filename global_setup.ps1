# Install all required python versions

# Run PowerShell in admin mode

# [1] Software
# -----------------------------------------------------------------------

# Chocolatey Package Manager
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco -v

# [1] Non Sucking Service (NSS)
# =======================================================================
# [1.1] Install NSS to "c:\Program Files\NSS"
Invoke-WebRequest -Uri "URL_TO_NSSM_ZIP" -OutFile "C:\path\to\nssm.zip"
Expand-Archive -LiteralPath "C:\path\to\nssm.zip" -DestinationPath "C:\Program Files\NSS" -Force
nssm version
???

# PYTHON VERSIONS

# [2] PYTHON 3.9
# ========================================================================

# [2.1] Update PIP

# [2.2] Install virtual environment package

# [2.3] Set an alias for the this python instance
echo "alias python3=/bin/python3" >> ~/.bashrc


# [3] Python 3.10
# ========================================================================

# [3.1] Update PIP

# [3.2] Install virtual environment package

# [3.3] Set an alias for the this python instance


# INSTALL ALL THE R VERSIONS THAT APPS WILL NEED
rvm install R-4.1.0
rvm install R-3.6.3