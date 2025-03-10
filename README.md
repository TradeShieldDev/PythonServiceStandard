# Python / R Skeleton
This spike shows the basic setup and structure that Python/R applications should have.


## Server Setup
- [x] Packaged managed multiple (thin) Python version support with Alias
- [x] Packaged and managed multiple versions of R
- [x] Create NSSM Windows Services for all Python services (Using relative paths)
- [x] Never use the host Python versions to run or add modules; each application must have its virtual environment


## Application Setup
- [x] Include [initial_setup.ps1] PowerShell script to assist in the consistent setup of the service
- [x] Include [run_me.ps1] script for the Windows Service to start the Python Application
- [x] Include [requirements.txt] to ensure all the required modules are installed
- [x] Always use [main.py] as the starting Python file for all applications
- [x] For sensitive information, define and use Environment Variables in the initial setup script (No Sensitive Information in Source Control)
- [ ] For normal configuration, use [config.ini] for basic configurations or [app_config.json] for nested config structures

## General Python
- [ ] Pydantic Types, i.e. Variables, are declared with specific data types
- [x] Snake notation for everything except Class Name,s which is title case
- [ ] Common SDK / Seedworks project for the common utilities (Intrumentation, Configuration, etc)
