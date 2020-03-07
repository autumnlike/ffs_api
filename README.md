# FFS API

FFSを活用する便利な機能のAPI提供ツール
主に、以下2つの機能があります。

- Slackのスラッシュコマンド機能
- Web機能

## 環境構築

1. Rails の通常の構築
```
$ git clone git@github.com:autumnlike/ffs_api.git
$ bundle install --path=/PATH/TO

# DB
$ ./bin/rails db:create
$ ./bin/rails db:migrate
$ ./bin/rails db:seed

# dotenv
$ cp dotenv.sample .env
$ vi .env # 適切な値に
```

## Ethosからのデータインポート

1. 個人管理 > 検索・編集 > ユーザー全件を表示
1. 「検索結果CSVダウンロード」 > UTF-8

でダウンロードできます。

## DBにインポート

1. ダウンロードしたファイルを `RAILS_ROOT/tmp` 配下に設置
1. インポートコマンドを実行
```
$ cd RAILS_ROOT
$ ./bin/rake import_user_ffs:by_ethos
```

## API

APIはすべて [apiary](https://sakiyoshi.docs.apiary.io/#reference/0/0) にて管理しているので、こちらを参照・更新してください。
