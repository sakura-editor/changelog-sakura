@echo off

setlocal

call %~dp0env-set.bat

gem install github_changelog_generator
endlocal
