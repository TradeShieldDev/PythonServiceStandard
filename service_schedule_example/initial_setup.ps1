
# Prerequisites
# 1. [requirements.txt] with all the modules needed for this application
# 2. [run_me.ps1] with [relative] paths pointing to the [local_env] for python and then running the [main.py] 

# Set Application Environment Variables (Sensitive settings)
# =================================================================================================
# Important! Need to update the secrets before running or update them afterwards (DO NOT SAVE IN SOURCE CONTROL)
[System.Environment]::SetEnvironmentVariable("ScheduleService_Secret", "ScheduleServiceSecret", "1234-56789-0000")

# Load Aliases
# ==============================================================================================
. $PROFILE.AllUsersAllHosts


# Create local python instance
# ===============================================================================================
python39 -m virtualenv local_env
./local_env/Scripts/activate

# Update package Manager
python -m pip install --upgrade pip

# Install required packages
pip install -r requirements.txt

# Create Local Service
# =================================================================================================

$serviceName = "PRE-ScheduleExampleService"
$scriptPath  = "run_me.ps1"
$displayName = "Company Name - Schedule Example Service"

# Install the service, using powershell.exe as the Application with arguments
& nssm install $serviceName "powershell.exe" `
    "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""

# Optionally set some service parameters (example: DisplayName and start mode)
& nssm set $serviceName DisplayName $displayName
& nssm set $serviceName Start SERVICE_AUTO_START
& sc.exe config $serviceName start=delayed-auto

# Start the newly installed service
& nssm start $serviceName


# =========================================================================
# VS Code
# =========================================================================
<# This will setup the virtual environment for VS Code

	Make sure you installed the Python extention
	Select VS Code Interpretor: Ctrl+Shift+P > [python: Select Interpreter]

#>


# =========================================================================
# NSSM Commands
# =========================================================================
<# This will uninstall the above service

	$serviceName = "PRE-ScheduleExampleService"
	& nssm stop $serviceName
	& nssm remove $serviceName confirm

#>

# =========================================================================
# PIP Commands
# =========================================================================
<#
	pip freeze > requirements.txt              Save all the current modules
#>

# =========================================================================
# PowerShell Script Execution Context
# =========================================================================
<#
	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
#>


# =========================================================================
# Source Control - Add the SDK Submodule
# =========================================================================
<#
	# Open the Poweshell script in the root folder of the application before running this
	
	git submodule add https://github.com/TradeShieldDev/SeedworksPython.git sdk
#>






