# README

## users Table

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname----------|string|null: false--------------|
|profile-----------|string|null: true---------------|
|email-------------|string|null: false, unique: true|
|encrypted_password|string|null: false--------------|
|profile_image     |string|null: true---------------|
### Association
has_many :recipes
has_many :comments

- email, passwordGemを使用

## recipes Table
|Column      |Type      |Options                       |
|------------|----------|------------------------------|
|user--------|references|null: false, foreign_key: true|
|title-------|string----|null: false-------------------|
|material----|text------|null: false-------------------|
|make--------|text------|null: false-------------------|
|recipe_image_id|string-|null: true-----------------|

### Association
belongs_to :user
has_many :comments


## comments Table
|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|user---------|references|null: false, foreign_key: true|
|recipe-------|references|null: false, foreign_key: true|
|comment_text|text------|null: false-------------------|

### Association
belongs_to :user
belongs_to :recipe

## favorites Table
|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|user---------|references|null: false, foreign_key: true|
|recipe-------|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :recipe


# アプリケーション名
D recipe

# アプリケーション概要
レシピをすぐに見つけることができる痩せたい人向けのダイエッター専用レシピアプリ

# URL
https://oriapp-c41j.onrender.com/
# テスト用アカウント
Basic認証パスワード: admin
Basic認証ID: 1234
メールアドレス:
パスワード:
# 利用方法

## レシピ投稿
1.トップページのヘッダーから新規登録またはログインを行う
2.トップページ右下の「投稿する」ボタンをクリックし、（レシピ名、材料、作り方、画像）を入力し投稿する
3.トップページの新着レシピに掲載される
4.ヘッダーのマイページから投稿したレシピを確認できる。（詳細、編集、削除ができる）

## レシピ検索
1.ヘッダー下の検索フォームから検索し、レシピを探す（タイトルに含まれる文字のみ）
2.気に入ったものがあればハートマークをタップしお気に入りをすることができる
3.お気に入りしたものはマイページのお気に入り一覧で閲覧可能

# アプリケーションを作成した背景
私自身現在ダイエットをしており、食事を作る際に数多くのレシピの中から探すのが時間がかかることが多々あった。
家族からも「レシピを探すだけで時間がかかる、面倒だ」という声が上がり、ダイエットレシピだけを取り扱うサイトがあったら便利なのではないかと考えた。
同様の問題を抱えている方も多いと予測し、この悩みを解決するために、痩せたい人向けのダイエット専用のレシピアプリの開発をすることにした。

# 洗い出した要件
要件定義書
https://docs.google.com/spreadsheets/d/1HoxOoZOIBrmSqLRdtUcdNfvxwi0aORO4/edit?usp=sharing&ouid=101825916746590534349&rtpof=true&sd=true

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
通報機能を実装予定

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/d96cf612c649f12b47289be140278822.png)](https://gyazo.com/d96cf612c649f12b47289be140278822)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/c0c49d6b268fb0b517469a7362c97826.png)](https://gyazo.com/c0c49d6b268fb0b517469a7362c97826)

# 開発環境
・フロントエンド
・バックエンド
・テキストエディタ
・Github
# ローカルでの動作方法
% git clone https://github.com/chobichobi62/oriapp]

# 工夫したポイント
・見た目をオシャレにこだわった
・トップページのダイエットの豆知識を入れることで、ダイエットを継続的に取り組めるようにしている
・お気に入り機能を実装することで、お気に入りしたレシピをいつでも確認することができる

# 改善点
検索機能でタイトルだけでなく、材料の名前でも検索できるようにする
マイページやお気に入り一覧でのレシピの見づらさ（画像の大きさ）を改善する
トップページの新着レシピ以外に、お気に入りの数でレシピ一覧を表示する
投稿する際の材料や作り方に区切りや数字などを入れてわかりやすく表示させる

# 制作時間
約60時間