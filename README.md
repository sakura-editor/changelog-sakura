# sakura editor の ChangeLog を生成するためのリポジトリです。

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

### GitHub Access Token の使用方法

1. https://github.com/settings/tokens/new にアクセスします。
2. 以下画面で、`Token description` にわかり易い名前をつけた上で、`repo` にチェックを付けて、`Generate token` を押します。
   ![Access Token](image/generate-access-token.png)
3. Access Token が生成されるのでクリップボードにコピーします。

**注意: この GitHub Access Token はアカウント名とパスワードをあわせたものと同等なので誤って漏れないように注意してください。**

## github_changelog_generator のインストール

Ruby が利用可能な環境で以下を実行します。

```
installLog.bat
```

あるいは

```
gem install github_changelog_generator
```

installLog.bat は Python 2.5 を想定していますが、PATH を通せば他のバージョンでも構いません。

## github_changelog_generator の実行

### GitHub Access Token の設定

github_changelog_generator のインストールをしたあとに GitHub Access Token を環境変数に設定します。XXXX の部分は生成した Access Token です。

```
set CHANGELOG_GITHUB_TOKEN=XXXXX
```

### 実行

以下バッチファイルを実行します。

```
generateChangeLog.bat
```

以下でヘルプが表示されるのでいろんなオプションを試すことができます。

```
github_changelog_generator --help
```
