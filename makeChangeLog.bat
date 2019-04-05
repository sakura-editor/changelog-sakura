@echo off

setlocal

call %~dp0env-set.bat

REM 日本語を扱えるように内部エンコーディングを UTF-8 にする
set RUBYOPT=-EUTF-8:UTF-8

set ACCOUNTNAME=sakura-editor
set PROJECTNAME=sakura
set OUTFILENAME=CHANGELOG.md
set EXCLUDELABELS=duplicate,question,invalid,wontfix,CI,management,refactoring,no-changelog
set BREAKING_LABELS="specification change"

@echo.
@echo INFO: APPVEYOR_REPO_NAME                   = %APPVEYOR_REPO_NAME%
@echo INFO: APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME = %APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME%
@echo.

set SECURE_VAR_IS_VALID=
if not defined APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME (
	@rem if APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME is empty, it is not a PR.
	set SECURE_VAR_IS_VALID=1
) else if "%APPVEYOR_REPO_NAME%" == "%APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME%" (
	@rem if APPVEYOR_REPO_NAME and APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME are equal, it is a PR from the same repository.
	set SECURE_VAR_IS_VALID=1
)

if not defined SECURE_VAR_IS_VALID (
	@echo secure variable is valid only in a PR from the same repository or in a branch build.
	@echo secure variable is not available in this build, so skip build.
	endlocal
	exit /b 0
)

if not defined CHANGELOG_GITHUB_TOKEN (
	@echo 1. you need to define env variable CHANGELOG_GITHUB_TOKEN in advance.
	@echo 2. you can generate GitHub Access Token at https://github.com/settings/tokens/new
	@echo 3. you need to set env variable CHANGELOG_GITHUB_TOKEN on command line or CI.
	endlocal
	exit /b 1
)

github_changelog_generator                           ^
	-u %ACCOUNTNAME%                                 ^
	-p %PROJECTNAME%                                 ^
	-o %OUTFILENAME%                                 ^
	--exclude-labels %EXCLUDELABELS%                 ^
	--breaking-labels %BREAKING_LABELS%              ^
	--cache-file %TEMP%\github-changelog-http-cache  ^
	--cache-log  %TEMP%\github-changelog-logger.log

endlocal
