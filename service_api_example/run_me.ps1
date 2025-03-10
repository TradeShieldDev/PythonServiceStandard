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
# Function to start the FastAPI app using uvicorn
function Start-FastAPI {
    uvicorn main:app --host 127.0.0.1 --port 8000 --reload
}

# Start the app, restart if it stops unexpectedly
do {
    Write-Host "Starting FastAPI Service..."
    Start-FastAPI
    Write-Host "FastAPI Service stopped unexpectedly. Restarting in 10 seconds..."
    Start-Sleep -Seconds 10
}
while ($true)


# Uncomment the below for local debugging
# Read-Host

Write-Host "Python service has stopped."

