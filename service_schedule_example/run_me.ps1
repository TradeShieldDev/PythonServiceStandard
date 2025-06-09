Write-Host "Starting Python service from virtual environment..."

$envPath = "./local_env/Scripts/activate.ps1"
# Step 1: Ensure the activation script exists
if (-not (Test-Path $envPath)) {
    throw "Virtual environment activation script not found at '$envPath'."
}
# Step 2: Test that activating the venv changes Python version
$envPython = powershell -ExecutionPolicy Bypass -NoProfile -Command "& {` 
    . $envPath; `
    python -c 'import sys; print(sys.prefix)' }"
if (-not ($envPython -like "*local_env*")) {
    throw "Virtual environment activation failed. Still using global Python: $envPython"
}

# Step 3: If successful, activate and run
. $envPath
python main.py

# Choose which R Environment to use
Remove-Item alias:R -Force
Set-Alias -Name R -Value r36 -Force
R --version


# Uncomment the below for local debugging
# Read-Host
# Write-Host "Python service has stopped."

