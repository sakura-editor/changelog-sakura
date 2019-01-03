# `CHANGELOG.md` を生成するための仕組み

[![Build status](https://ci.appveyor.com/api/projects/status/9lapqyq8h7ak1otj/branch/master?svg=true)](https://ci.appveyor.com/project/sakuraeditor/changelog-sakura/branch/master)

<!-- TOC -->

- [`CHANGELOG.md` を生成するための仕組み](#changelogmd-を生成するための仕組み)
    - [ChangeLog の生成方法](#changelog-の生成方法)
        - [github_changelog_generator の使い方のドキュメント](#github_changelog_generator-の使い方のドキュメント)
    - [GitHub Access Token](#github-access-token)
        - [GitHub Access Token に関して](#github-access-token-に関して)
        - [GitHub Access Token の作成方法](#github-access-token-の作成方法)
    - [github_changelog_generator のインストール](#github_changelog_generator-のインストール)
        - [通常版を使用](#通常版を使用)
        - [GitHub から任意のバージョンを取得して使用](#github-から任意のバージョンを取得して使用)
    - [github_changelog_generator の実行](#github_changelog_generator-の実行)
        - [GitHub Access Token の設定](#github-access-token-の設定)
        - [実行](#実行)

<!-- /TOC -->

## ChangeLog の生成方法

[github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator) を使用してChangeLog を生成します。

### github_changelog_generator の使い方のドキュメント

https://github.com/github-changelog-generator/github-changelog-generator#usage

## GitHub Access Token

### GitHub Access Token に関して

github_changelog_generator は GitHub API を使用して GitHub から情報を取得して自動的に ChangeLog を生成します。
GitHub API は匿名アクセスの場合、一時間あたり 60 リクエストという制限があります。Access Token を使用することで
一時間あたり 5000 リクエストに拡大することができます。

https://developer.github.com/v3/#rate-limiting

サクラエディタでは、匿名アクセスの制限では足りないので、制限を緩和するために Access Token を使用します。

### GitHub Access Token の作成方法

**注意: この GitHub Access Token はアカウント名とパスワードをあわせたものと同等なので誤って漏れないように注意してください。**

1. https://github.com/settings/tokens/new にアクセスします。
2. 以下画面で、`Token description` にわかり易い名前をつけた上で、`repo` の `public_repo` にチェックを付けて、`Generate token` を押します。(`repo` 全体にチェックをつける必要はありません。)
   ![Access Token](image/generate-access-token.png)
3. Access Token が生成されるのでクリップボードにコピーします。


## github_changelog_generator のインストール

Ruby 2.5 を想定していますが、PATH を通せば他のバージョンでも構いません。
あるいは `env-set.bat` をローカルで書き換えてもいいです。
Ruby が利用可能な環境で以下を実行します。

### 通常版を使用

バッチファイルで指定されているバージョンの [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator) を gem で取得してインストールします。

```
installChangeLog.bat
```

### GitHub から任意のバージョンを取得して使用

```
installChangeLogFromGitHub.bat [version]
```

- `version` を省略すると [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator) の `master` を取得してインストールします。
- `version` には [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator) で有効なタグ、ブランチ、コミットハッシュなど `git checkout` に指定できるcommit を特定する情報を指定します。

## github_changelog_generator の実行

### GitHub Access Token の設定

github_changelog_generator のインストールをしたあとに GitHub Access Token を環境変数に設定します。XXXX の部分は生成した Access Token です。

```
set CHANGELOG_GITHUB_TOKEN=XXXXX
```

### 実行

以下バッチファイルを実行します。

```
makeChangeLog.bat
```

以下コマンドで `github_changelog_generator` のヘルプが表示されるのでいろんなオプションを確認することができます。

```
github_changelog_generator --help
```
