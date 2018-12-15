@echo off

setlocal

call %~dp0env-set.bat

call gem uninstall -a -x github_changelog_generator
endlocal
