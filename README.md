# README

## users Table

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname----------|string|null: false--------------|
|profile-----------|string|null: true---------------|
|email-------------|string|null: false, unique: true|
|encrypted_password|string|null: false--------------|

### Association
has_many :recipes
has_many :comments

- email, password,profile_imageはGemを使用

## recipes Table
|Column      |Type      |Options                       |
|------------|----------|------------------------------|
|user--------|references|null: false, foreign_key: true|
|title-------|string----|null: false-------------------|
|make--------|text------|null: false-------------------|
|recipe_image|string----|null: false-------------------|

### Association
belongs_to :user
has_many :comments

- recipe_imageはGemを使用


## comments Table
|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|user---------|references|null: false, foreign_key: true|
|recipe-------|references|null: false, foreign_key: true|
|comments_text|text------|null: false-------------------|

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