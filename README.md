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
|material----|string----|null: false-------------------|
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