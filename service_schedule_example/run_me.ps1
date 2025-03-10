Write-Host "Starting Python service from virtual environment..."

# We use $PSScriptRoot if available (PowerShell v3+). Otherwise fallback
if ($PSScriptRoot) {
    $scriptDir = $PSScriptRoot
} else {
    $scriptDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
}

Write-Host "Starting Python script from local environment..."

# Build relative paths to the Python interpreter and main.py
$pythonPath = Join-Path $scriptDir ".\local_env\Scripts\python.exe"
$mainPyPath = Join-Path $scriptDir ".\main.py"

# Set the correct R version to use for this application
rvm use R-4.1.0

# Running the main.py from the local virtual python
& $pythonPath $mainPyPath

Write-Host "Python service has stopped."

# Uncomment the below for local debugging
# Read-Host