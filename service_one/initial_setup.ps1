
# Prerequisites
# 1. [requirements.txt] with all the modules needed for this application
# 2. [run_me.ps1] with [relative] paths pointing to the [local_env] for python and then running the [main.py] 

# Set Application Environment Variables (Sensitive settings)


# Create local python instance
# ===============================================================================================
python39 virtualenv local_env
./local_env/Scripts/activate

# Update package Manager
python -m pip install --upgrade pip

# Install required packages
pip install -r requirements.txt

# Create Local Service
# =================================================================================================

param(
    [string]$ServiceName = "TS_ServiceOne",
    [string]$DisplayName = "Trade Shield Service One",
    [string]$Description = "Service to run main.py in a local Python environment via run_me.ps1"
)

# If $PSScriptRoot isn't available, fallback to older method
if ($PSScriptRoot) {
    $scriptDir = $PSScriptRoot
} else {
    $scriptDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
}

Write-Host "Installing/updating $ServiceName using NSSM..."

# Path to nssm.exe (relative)
$NSSMPath = Join-Path $scriptDir "nssm.exe"

# The application we want NSSM to run is powershell.exe, which is usually in System32
$powershellExe = (Join-Path $env:SystemRoot "System32\WindowsPowerShell\v1.0\powershell.exe")

# We want to call run_me.ps1 with an ExecutionPolicy bypass
$runMeScript = Join-Path $scriptDir ".\run_me.ps1"
$appParameters = "-ExecutionPolicy Bypass -File `"$runMeScript`""

# 1) Install or update the NSSM service
& $NSSMPath install $ServiceName $powershellExe

# 2) Specify the parameters to run run_me.ps1
& $NSSMPath set $ServiceName AppParameters $appParameters

# 3) Set the working directory (so logs, etc. remain local)
& $NSSMPath set $ServiceName AppDirectory $scriptDir

# 4) Set DisplayName and Description
& $NSSMPath set $ServiceName DisplayName $DisplayName
& $NSSMPath set $ServiceName Description $Description

# 5) Optionally set it to auto-start on boot
& $NSSMPath set $ServiceName Start SERVICE_AUTO_START

# 6) Start the service
Start-Service $ServiceName

Write-Host "Service $ServiceName installed and started successfully."
















