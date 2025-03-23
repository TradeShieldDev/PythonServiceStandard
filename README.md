# Python / R Skeleton
This spike shows the basic setup and structure that Python/R applications should have.

## Server Setup
- [x] Packaged managed multiple (thin) Python version support with Alias
- [x] Packaged and managed multiple versions of R
- [x] Create NSSM Windows Services for all Python services (Using relative paths)
- [x] Never use the host Python versions to run or add modules; each application must have its virtual environment
- [x] Mono Repo - Reduces the need for complex interdependent package management

## General Python
- [x] Pydantic Types, i.e., Variables, are declared with specific data types
- [x] [snake_notation] for everything except class names, which are [Title Case]
- [x] Common SDK / Seedworks project for the common utilities (Instrumentation, Configuration, etc)
- [x] Make use of a logger with file rollover (size/day) and archiving mechanism
- [x] Include IsAlive / External Health Check
- [ ] Low-level performance counters for Attempt-Success-Failure
- [ ] Unit testing and Stubbing / Simulators


## General things to avoid in Python
- [ ] DB management, SQL Alchemy is not as advanced as Entity Framework (If possible). Try avoiding DB interactions otherwise, keep it simple.
- [ ] Highly concurrent applications, if this is needed, wrap Python in a C# host that has multiple Python instance pools
- [ ] Shared infrastructure, build things like Message Brokers and Event Sourcing in C# for optimal performance 

## General Application Setup
- [x] Include [initial_setup.ps1] PowerShell script to assist in the consistent setup of the service
- [x] Include [run_me.ps1] script for the Windows Service to start the Python Application
- [x] Include [requirements.txt] to ensure all the required modules are installed
- [x] Always use [main.py] as the starting Python file for all applications
- [ ] For sensitive information, define and use Environment Variables in the initial setup script (No Sensitive Information in Source Control)

## Example Services

### Schedule Example
- [x] Use [config.ini] for basic Section + Key-Value configurations
- [x] Python 3.9 with R.Project 3.6.3

### API Examples
- [x]  Use [app_config.json] when there are complex multi-level config needs
- [x]  Python 3.10 with R.Project 4.4.0
- [x]  FastAPI, including Standard Health API, extended with custom health checks

![image](https://github.com/user-attachments/assets/9cf4a864-d1ae-48c6-a5d5-da8d40e00c84)

## CI/CD
- [ ] JSON / INI Variable Replacement during deployment
- [ ] Managing the Windows Services from Source Control
- [ ] Running Unit Tests
