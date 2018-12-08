@echo off

setlocal

call %~dp0env-set.bat

set ACCOUNTNAME=sakura-editor
set PROJECTNAME=sakura
set OUTFILENAME=ChangeLog.md

if not defined CHANGELOG_GITHUB_TOKEN (
	@echo 1. you need to define env variable CHANGELOG_GITHUB_TOKEN in advance.
	@echo 2. you can generate GitHub Access Token at https://github.com/settings/tokens/new
	@echo 3. you need to set env variable CHANGELOG_GITHUB_TOKEN on command line or CI.
	exit /b 1
)

github_changelog_generator                                                               ^
	-u %ACCOUNTNAME%                                                                     ^
	-p %PROJECTNAME%                                                                     ^
	-o %OUTFILENAME%                                                                     ^
	--exclude-labels duplicate,question,invalid,wontfix,CI,management,refactoring        ^
	--cache-file %TEMP%\github-changelog-http-cache                                      ^
	--cache-log  %TEMP%\github-changelog-logger.log
endlocal
