@echo off

setlocal

call %~dp0env-set.bat

REM faraday 0.16 でエラーが発生するのでバージョンを固定する
REM https://github.com/sakura-editor/changelog-sakura/issues/26
call gem install faraday --version 0.15.4

call gem install github_changelog_generator --version 1.15.0.pre.beta
endlocal
