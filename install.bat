@echo off

set PROGRAM_NAME=SandC
set INSTALL_FILE=%PROGRAM_NAME%.exe

REM The following variables are depend on your environment.
REM If needed, change the values.
set INSTALL_DIR=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\

cd %~dp0

if "%~1"=="clean" (
    echo Removing %INSTALL_FILE% from %INSTALL_DIR%...
    del "%INSTALL_DIR%%INSTALL_FILE%"
    goto :eof
)

if not exist "%INSTALL_FILE%" (
    echo %INSTALL_FILE% not found. Running compile.bat...
    call compile.bat
)

echo Installing %INSTALL_FILE% to %INSTALL_DIR%
copy "%INSTALL_FILE%" "%INSTALL_DIR%%INSTALL_FILE%"
