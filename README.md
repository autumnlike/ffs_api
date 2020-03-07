# FFS API

FFSを活用する便利な機能のAPI提供ツール
主に、以下2つの機能があります。

- Slackのスラッシュコマンド機能
- Web機能

## 環境構築

### Rails

#### セットアップ

```
$ git clone git@github.com:autumnlike/ffs_api.git
$ bundle install --path=/PATH/TO
```

#### DB
```
$ ./bin/rails db:create
$ ./bin/rails db:migrate
$ ./bin/rails db:seed
```

#### dotenv

```
$ cp dotenv.sample .env
$ vi .env # 適切な値に
# Service Domain
DOMAIN='https://yourdomain.com/'

# SLACK API TOKEN
SLACK_TOKEN='Slack > Install App > OAuth Access Token'

# Api Token
API_TOKEN='App Credentials > Verification Token'

# Google
GOOGLE_CLIENT_ID=''
GOOGLE_CLIENT_SECRET=''
GOOGLE_CLIENT_DOMAIN='Googleログイン制限するドメイン 例: @lancers.co.jp'

# Google Analytics
GA_TRACKER='Google Analytics Tracker'
```
### Slack環境
#### [Slack App](https://api.slack.com/apps) に登録

[Slack App](https://api.slack.com/apps) にてアプリを追加してください。

#### Slack -> このアプリへの認証APIトークンを取得

App Credentials > Verification Token の値を `.env` の `API_TOKEN` に設定

#### Slash Command の登録

Features > Slash Commands にて、コマンドを追加する

command | Short Description | Request URL
-- | -- | --
/ffs | FFS説明の取得 | https://:your_domain/v1/slack/user
/ffs_mine | 自分のFFS結果を見る | https://:your_domain/v1/slack/my
/ffs_info | FFS 各因子の説明が見れます | https://:your_domain/v1/slack/ffs
/ffs_type | BE/CD 等 91type にマッチするひとを探す | https://:your_domain/v1/slack/user_type
/ffs_same | 自分と同じ個性の人一覧を見る | https://:your_domain/v1/slack/same_user

※ コマンド名や説明は自由に設定可能です。

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
