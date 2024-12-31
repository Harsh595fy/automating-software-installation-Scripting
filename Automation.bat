@echo off
title Automated Windows Setup with Important Software
echo Starting the Automated Windows Setup...

:: Check if Chocolatey is installed
echo Checking for Chocolatey package manager...
where choco >nul 2>nul
if %errorlevel% neq 0 (
    echo Installing Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
) else (
    echo Chocolatey is already installed.
)

:: Update Chocolatey
echo Updating Chocolatey...
choco upgrade chocolatey -y

:: Install Browsers
echo Installing Browsers...
choco install googlechrome -y
choco install firefox -y

:: Install Media Players
echo Installing Media Players...
choco install vlc -y
choco install spotify -y

:: Install Archiving Tools
echo Installing Archiving Tools...
choco install 7zip -y
choco install winrar -y

:: Install Developer Tools
echo Installing Developer Tools...
choco install python --version=3.13.1 -y
choco install python2 -y
choco install filezilla -y
choco install notepadplusplus -y
choco install adoptopenjdk8 -y
choco install adoptopenjdk11 -y
choco install adoptopenjdk17 -y
choco install adoptopenjdk21 -y
choco install winscp -y
choco install putty -y
choco install winmerge -y
choco install eclipse -y
choco install vscode -y

:: Install Gaming Client
echo Installing Steam...
choco install steam -y

:: Final System Updates
echo Performing final updates...
choco upgrade all -y

:: Cleanup
echo Cleaning up temporary files...
choco cleanup -y

echo Setup is complete! Restarting your system in 15 seconds to apply changes...
shutdown /r /t 15
