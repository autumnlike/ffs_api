# FFS API

FFSを活用する便利な機能のAPI提供ツール
しかし、時間の問題から、Slack との連携ツールにとどまっているのが現状。

## 環境構築

1. Rails の通常の構築
```
$ git clone git@github.com:autumnlike/ffs_api.git
$ bundle exec --path=/PATH/TO

# DB
$ ./bin/rails db:create
$ ./bin/rails db:migrate
$ ./bin/rails db:seed

# dotenv
$ cp dotenv.sample .env
$ vi .env # 適切な値に
```

## API

APIはすべて [apiary](https://sakiyoshi.docs.apiary.io/#reference/0/0) にて管理しているので、こちらを参照・更新してください。

## 運用環境

[Heroku](https://dashboard.heroku.com/apps) にて運用中。

```
# デプロイ
$ git push heroku master
# 起動
$ heroku ps:scale web=1
# 停止
$ heroku ps:scale web=0
# ログ
$ heroku logs -t
```
