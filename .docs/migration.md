# migration
## マイグレーションファイル作成
```sh
bundle exec rails g migration hoge
```
## マイグレーション適用
```sh
bundle exec rails db:migrate
```
## マイグレーション切り戻し
```sh
bundle exec rails db:rollback
```
