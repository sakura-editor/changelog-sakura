@echo off

setlocal

call %~dp0env-set.bat

REM 日本語を扱えるように内部エンコーディングを UTF-8 にする
set RUBYOPT=-EUTF-8:UTF-8

set ACCOUNTNAME=sakura-editor
set PROJECTNAME=sakura
set OUTFILENAME=CHANGELOG.md
set OUTFILENAME_WITHOUT_ISSUES=CHANGELOG_without_issues.md
set EXCLUDELABELS=CI,CodeFactor,duplicate,environment,Git,management,no-changelog,question,refactoring,Release,research
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

call github_changelog_generator                      ^
	-u %ACCOUNTNAME%                                 ^
	-p %PROJECTNAME%                                 ^
	-o %OUTFILENAME%                                 ^
	--exclude-labels %EXCLUDELABELS%                 ^
	--breaking-labels %BREAKING_LABELS%              ^
	--no-filter-by-milestone                         ^
	--cache-file %TEMP%\github-changelog-http-cache  ^
	--cache-log  %TEMP%\github-changelog-logger.log  || (echo error run github_changelog_generator && exit /b 1)

@echo.
@echo filter issues
@echo.
REM issues を除外する
REM (github_changelog_generator の --no-issues ではカテゴリ分類が消えるため)

perl -pe "{binmode(STDOUT)} s/^-.*\/issues\/\d+\)\n//g; s/\*\*Closed issues:\*\*\n//g;" %OUTFILENAME% > %OUTFILENAME_WITHOUT_ISSUES%

endlocal
