# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string||
|email|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|

### Association
- has_many :articles
- has_many :comments
- has_many :likes
- has_many :relationships
- has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverses_of_relationship, source: :user
- has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
- has_many :followings, through: :relationships, source: :follow
- has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
- has_many :followers, through: :passive_relationships, source: :follower

## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|follower_id|integer||
|followed_id|integer||

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

## articlesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|title|string||
|text|text||
|image|string||
|user_id|integer|null: false, foreign_key|

### Association
- has_many :comments
- belongs_to :user
- has_many :likes
- has_many :article_tags
- has_many :tags, through: :article_tags



## article_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|article_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :article
- belongs_to :tag

## tagsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|

### Association
- has_many :article_tags
- has_many :articles, through: :article_tags

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|user_id|integer|null: false, foreign_key|
|comment_id|integer|null: false, foreign_key|
|text|text||

### Association
- belongs_to :article
- belongs_to :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|article_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key|

### Association
- belongs_to :user
- belongs_to :article










