# sakura editor の ChangeLog を生成するためのリポジトリです。

[![Build status](https://ci.appveyor.com/api/projects/status/9lapqyq8h7ak1otj/branch/master?svg=true)](https://ci.appveyor.com/project/sakuraeditor/changelog-sakura/branch/master)

<!-- TOC -->

- [sakura editor の ChangeLog を生成するためのリポジトリです。](#sakura-editor-の-changelog-を生成するためのリポジトリです)
    - [概要](#概要)
        - [生成した変更履歴のダウンロード](#生成した変更履歴のダウンロード)
            - [ダウンロード先](#ダウンロード先)
        - [ダウンロードした変更履歴の確認方法](#ダウンロードした変更履歴の確認方法)
    - [`CHANGELOG.md` を生成するための仕組み](#changelogmd-を生成するための仕組み)
    - [appveyor の設定方法説明](#appveyor-の設定方法説明)

<!-- /TOC -->

## 概要

このリポジトリは [サクラエディタ](https://github.com/sakura-editor/sakura) の変更履歴を markdown の形で [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator) を使って自動生成するためのリポジトリです。

どのようなオプション(除外するタグなど)を使用するかは検討中です。  
何か提案等あれば大歓迎です。

issue への登録をお願いします。

### 生成した変更履歴のダウンロード

[日本時間 AM 3:00 に毎日 master に対して](https://github.com/sakura-editor/changelog-sakura/issues/6
) 自動的に [appveyor](https://ci.appveyor.com/project/sakuraeditor/changelog-sakura) でビルドされるので最新のものをダウンロードできます。

最新でなくてもよければ [こちら](https://github.com/sakura-editor/sakura/wiki/CHANGELOG.md%E3%82%B9%E3%83%8A%E3%83%83%E3%83%97%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88) からブラウザで確認できます。

#### ダウンロード先

https://ci.appveyor.com/project/sakuraeditor/changelog-sakura/build/artifacts 

### ダウンロードした変更履歴の確認方法

ダウンロードした `CHANGELOG.md` は
[Markdown をローカルで確認する方法](https://github.com/sakura-editor/sakura/wiki/markdown-%E3%82%92%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E3%81%A7%E7%A2%BA%E8%AA%8D%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)
で説明している手順でローカルで確認できます。 

## `CHANGELOG.md` を生成するための仕組み

[`CHANGELOG.md` を生成するための仕組み](Structure.md) を参照してください。


## appveyor の設定方法の説明

[appveyor の設定方法](appveyor.md) を参照してください。
