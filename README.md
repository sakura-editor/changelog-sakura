# sakura editor の ChangeLog を生成するためのリポジトリです。

[![Build status](https://ci.appveyor.com/api/projects/status/9lapqyq8h7ak1otj/branch/master?svg=true)](https://ci.appveyor.com/project/sakuraeditor/changelog-sakura/branch/master)

<!-- TOC -->

- [sakura editor の ChangeLog を生成するためのリポジトリです。](#sakura-editor-の-changelog-を生成するためのリポジトリです)
    - [`CHANGELOG.md` に関して](#changelogmd-に関して)
    - [生成した `CHANGELOG.md` のダウンロードおよびローカルの確認](#生成した-changelogmd-のダウンロードおよびローカルの確認)
        - [ダウンロード先](#ダウンロード先)
        - [ダウンロードした `CHANGELOG.md` の確認方法](#ダウンロードした-changelogmd-の確認方法)
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
    - [appveyor での実行](#appveyor-での実行)
        - [appveyor での secure 変数](#appveyor-での-secure-変数)
            - [有効となる条件](#有効となる条件)
            - [有効か判定するロジック](#有効か判定するロジック)
        - [appveyor での 定期実行](#appveyor-での-定期実行)

<!-- /TOC -->

このリポジトリは [サクラエディタ](https://github.com/sakura-editor/sakura) の Issue や Pull Request などの情報を元に外部ツールを使って 自動的に Markdown の形式で ChangeLog を生成するためのプロジェクトです。

どのようなオプション(除外するタグなど)を外部ツールに渡して markdown の生成を行うかは検討中です。
何か提案等あれば issue への登録をお願いします。

## `CHANGELOG.md` に関して

[CHANGELOG.mdについて](https://github.com/sakura-editor/sakura/wiki/CHANGELOG.md%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6) のページに`CHANGELOG.md` に関する説明を記載しています。

## 生成した `CHANGELOG.md` のダウンロードおよびローカルの確認

### ダウンロード先

appveyor で生成した `CHANGELOG.md` は以下からダウンロードできます。

https://ci.appveyor.com/project/sakuraeditor/changelog-sakura/build/artifacts 

### ダウンロードした `CHANGELOG.md` の確認方法

ダウンロードした `CHANGELOG.md` は
[Markdown をローカルで確認する方法](https://github.com/sakura-editor/sakura/wiki/markdown-%E3%82%92%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E3%81%A7%E7%A2%BA%E8%AA%8D%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)
で説明している手順でローカルで確認できます。 

## ChangeLog の生成方法

[github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator) を
使用してChangeLog を生成します。

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

## appveyor での実行

appveyor で実行するときに `CHANGELOG_GITHUB_TOKEN` の環境変数を設定します。
その際、プレーンテキストで appveyor.yml に保存しなくていいように 
appveyor の設定画面で暗号化した上で設定します。

fork リポジトリに対して設定する場合と [sakura-editor organizaion のプロジェクト](https://ci.appveyor.com/project/sakuraeditor/changelog-sakura) で設定する場合で
手順に違いがあります。

1. 設定画面に移動し、`Environment` を選び、`Add variable` を選びます。

![環境変数追加1](image/env1.png)

2. エディットボックスに `CHANGELOG_GITHUB_TOKEN`と入力して、その右に実際の値を設定します。
3. そして、鍵ボタンを押します。(**重要**)

![環境変数追加2](image/env2.png)

4. `CHANGELOG_GITHUB_TOKEN` の値が隠れているのを確認して、画面の下までスクロールして `Save`を押します。(**重要**)

![環境変数追加3](image/env3.png)

5. (sakura-editor organizaion のプロジェクトのみ) [sakura-editor organizaion のプロジェクト](https://ci.appveyor.com/project/sakuraeditor/changelog-sakura) で `Settings` を選び、 `Export YAML` を選ぶと以下の画面になります。

![環境変数追加4](image/env4.png)

6. (sakura-editor organizaion のプロジェクトのみ) 以下の部分を appveyor.yml にコピーします。

```
environment:
  CHANGELOG_GITHUB_TOKEN:
    secure: buBWtAa04hCnz74nMONW8pZgTY9sx7fdKOPXpTsMs4JoxjWX/LRUBRcmlSjpvo1a
```

↑ この値は暗号化されているので値が公開されても問題ない。

7. (sakura-editor organizaion のプロジェクトのみ) appveyor.yml をコミットして push します。

### appveyor での secure 変数

#### 有効となる条件

Pull Request 内では secure 変更は基本的には無効になります。

ただし、`Settings` → `General` の `Enable secure variables in Pull Requests from the same repository only` の設定を有効にした場合
Pull Request の送り元ブランチが、同じリポジトリの場合のみ例外的に secure 変数が有効になります。

**設定変更後、忘れずに Save する必要があります。**

![Enable secure variables in Pull Requests from the same repository only](image/enable-secure-variables-in-pull-requests-from-same-repo.png)

参考: https://github.com/appveyor/ci/issues/2355#issuecomment-390803634

#### 有効か判定するロジック

|条件|APPVEYOR_REPO_NAME|APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME|secure 変数|処理実行の可否|
|--|--|--|--|--|
|ローカルビルド|空|空 (※1)|-|○|
|ブランチの appveyor ビルドの場合 (Fork)|xxx/changelog-sakura|空 (※1)|○ (UI で設定した場合)|○|
|ブランチの appveyor ビルドの場合 (sakura-editor)|sakura-editor/changelog-sakura|空 (※1)|○|○|
|PR (送信元: Fork のブランチ)|sakura-editor/changelog-sakura|xxx/changelog-sakura|×|×|
|PR (送信元: sakura-editor のブランチ)|sakura-editor/changelog-sakura|sakura-editor/changelog-sakura (※2)|○|○|

→ つまり、以下のいずれかの場合には `CHANGELOG_GITHUB_TOKEN` の変数が利用可能であり、空であればエラーとすればよい。

- `APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME` が空の場合 (※1)
- (上記は当てはまらなくて) `APPVEYOR_REPO_NAME` と `APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME` の値が等しい場合 (※2)

### appveyor での 定期実行

[サクラエディタ](https://github.com/sakura-editor/sakura) のリポジトリと、このリポジトリは別なので
定期的に実行して最新の `CHANGELOG.md` が生成されるようにします。

日本時間 AM 3:00 に master に対して自動的にビルドが走ります。

参考

- https://github.com/sakura-editor/changelog-sakura/issues/6

