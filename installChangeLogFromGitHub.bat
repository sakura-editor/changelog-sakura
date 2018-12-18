@echo off

setlocal

set BRANCH=%1

if "%BRANCH%" == "" (
	set BRANCH=master
)

call %~dp0env-set.bat
call uninstallChangeLog.bat
call gem install specific_install
call gem specific_install -l https://github.com/github-changelog-generator/github-changelog-generator.git -b %BRANCH%

endlocal
