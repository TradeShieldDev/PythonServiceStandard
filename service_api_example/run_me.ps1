Write-Host "Starting Python service from virtual environment..."

$RootPath = $PSScriptRoot

$pythonPath = Join-Path $RootPath "local_env\Scripts\python.exe"
Write-Host "Script directory: $RootPath"

$activationPath = Join-Path $RootPath "local_env\Scripts\Activate.ps1"
Write-Host "Virtual environment activation: $activationPath"

$mainPyPath = Join-Path $RootPath "main.py"

# Choose which R Environment to use
Set-Alias -Name R -Value r44 -Force
R --version

# Activate Virtual Environmen and print Python Version
. $activationPath
python --version

# Run the main python file from the virtual environment
python $mainPyPath

# Uncomment the below for local debugging
# Read-Host

Write-Host "Python service has stopped."

