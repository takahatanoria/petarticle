# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Name
  PetMeeting

# DEMO  

Please click the URL below.
You can browse how to use and feature description.

https://docs.google.com/document/d/1tEyPGFffAJRNbpGRqnSKEtGRqc5MVLyxzCu5-TejBrE/edit?usp=sharing

# Features

A communication website specializing in pets.
You can post articles by pet genre and category.
You can consulting about the pet's problems of living, discipline, illness, eating, care, etc.
In addition, you can post the daily life of the pet when you want to share.

# Requirement
  
* Ruby '2.5.1'
* Ruby on Rails 5.2.3

# Author
 
* Author NozomiTakeuchi
* E-mail n61.takeuchi.nozomi@gmail.com

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










