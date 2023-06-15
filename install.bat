@echo off
set /p folder_name=Enter project folder name:

echo.
echo Enter location (absolute path):
set /p location=

rem If the location is empty, set it to the user's home directory
if "%location%"=="" set "location=%USERPROFILE%"

rem Create the folder
set "folder_path=%location%\%folder_name%"
mkdir "%folder_path%"

rem Copy the .devcontainer folder and its contents
xcopy /E /I ".\.devcontainer" "%folder_path%\.devcontainer"

echo.
echo Folder '%folder_name%' created at '%location%'.
