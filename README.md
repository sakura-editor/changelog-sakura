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

### GitHub Access Token の作成方法

**注意: この GitHub Access Token はアカウント名とパスワードをあわせたものと同等なので誤って漏れないように注意してください。**

1. https://github.com/settings/tokens/new にアクセスします。
2. 以下画面で、`Token description` にわかり易い名前をつけた上で、`repo` の `public_repo` にチェックを付けて、`Generate token` を押します。(`repo` 全体にチェックをつける必要はありません。)
   ![Access Token](image/generate-access-token.png)
3. Access Token が生成されるのでクリップボードにコピーします。


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

1. 設定画面に移動し、`Environment` を選び、`Add variable` を選びます。

![環境変数追加1](image/env1.png)

2. `Environment Variable` に `CHANGELOG_GITHUB_TOKEN`と入力して、その右に実際の値を設定します。
3. そして、鍵ボタンを押します。(**重要**)

![環境変数追加2](image/env2.png)

4. `CHANGELOG_GITHUB_TOKEN` の値が隠れているのを確認して、画面の下までスクロールして `Save`を押します。(**重要**)

![環境変数追加3](image/env3.png)
