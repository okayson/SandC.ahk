@echo off

set PROGRAM_NAME=SandC
set INPUT_FILE=%PROGRAM_NAME%.ahk
set OUTPUT_FILE=%PROGRAM_NAME%.exe

REM The following variables are depend on your environment.
REM If needed, change the values.
set AHK_COMPILER="C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
set AHK_BASE="C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

cd %~dp0

echo Compiling...%OUTPUT_FILE%
%AHK_COMPILER% /in %INPUT_FILE% /base %AHK_BASE% /out %OUTPUT_FILE%
