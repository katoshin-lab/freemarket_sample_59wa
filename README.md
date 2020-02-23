# README

## General
- You can buy and sell items between users on this site.

---

## Detail

### User
- User log-in with your email address, google account and facebook account.
- When registrating, users are confirmed with sms messages and their email address.

### Item
- Users can registrate items with several images.
- Users can post a "like" with another user's item.
- Users use payment service with their credit card.

---

* Ruby version
- 2.5.1

---

* Database creation
- Volume of each column should be as small as possible.
- Table name must be plural.

## users table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unipue: true, index: true, limit: 40|
|email|string|null: false, unique: true, limit: 256|
|password|string|null: false, limit: 128|
|birthday|date|null: false|
|last_name|string|null: false, limit: 40|
|first_name|string|null: false, limit: 40|
|last_name_kana|string|null: false, limit: 40|
|first_name_kana|string|null: false, limit: 40|
|mobile_phone_number|integer|null: false, limit: 5|
|profile|text||
### Associations
- has_one :user_address
- has_one :user_delivery
- has_many :user_payments
- has_many :likes
- has_many :reports
- has_many :sell_items, class_name: "Item", foreign_key: "seller_id"
- has_many :buy_items, class_name: "Item", foreign_key: "buyer_id"
- has_many :dealing_items
- has_many :bought_items

## user_deliveries table
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false, limit: 40|
|first_name|string|null: false, limit: 40|
|last_name_kana|string|null: false, limit: 40|
|first_name_kana|string|null: false, limit: 40|
|postal_number|integer|null: false|
|prefecture|references|null: false, foreign_key: true, default: 0|
|city|string|null: false, limit: 50|
|block|string|null: false, limit: 50|
|building_name|string|limit: 50|
|phone_number|integer|limit: 5|
|user|references|null: false, foreign_key: true|
### Associations
- belongs_to :user
- belongs_to_active_hash :prefecture

## user_payments table
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## items table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 80|
|detail|text|null: false|
|condition_id|integer|null: false|
|price|integer|null: false|
|seller|references|null: false, foreign_key: {to_table: users}|
|is_seller_shipping|boolean|null: false, default: true|
|prefecture_id|integer|null: false|
|shipping_period_id|integer|null: false|
|shipping_method_id|integer|null: false|
|brand|references|foreign_key: true|
|category|references|null: false, foreign_key: true|
|item_status_id|integer|null: false|
### Associations
- belongs_to :seller, class_name: "User", optional: true
- has_many :images
- accepts_nested_attributes_for :images
- has_many :likes
- has_many :reports
- belongs_to :brand, optional: true
- belongs_to :category, optional: true
- belongs_to :subcategory, optional: true
- belongs_to :sub_subcategory, optional: true
- belongs_to_active_hash :condition
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_period
- belongs_to_active_hash :shipping_method
- belongs_to_active_hash :item_status

## likes table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Associations
- belongs_to :user
- belongs_to :item

## images table
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item, optional: true

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 40|
|ancestry|string|index: true|
### Associations
- has_many :items
- has_ancestry

## dealings table
|Column|Type|Options|
|------|----|-------|
|buyer|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|charge|string|null: false|
|dealing_status_id|integer|null: false|
|last_name|string|null: false, limit: 40|
|first_name|string|null: false, limit: 40|
|last_name_kana|string|null: false, limit: 40|
|first_name_kana|string|null: false, limit: 40|
|postal_number|integer|null: false|
|prefecture_id|integer|null: false, default: 0|
|city|string|null: false, limit: 50|
|block|string|null: false, limit: 50|
|building_name|string|limit: 50|
|phone_number|integer|limit: 5|
### Associations
- belongs_to :buyer, class_name: "User", optional: true
- belongs_to :item
- belongs_to_active_hash :dealing_status_id
- belongs_to_active_hash :prefecture_id

## sns_credentials table
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|integer||
|name|string||
|email|string||
|token|string||
### Association
- belongs_to :user, optional: true

---

## Gem list
### all
- rails
- mysql2
- puma
- sass-rails
- uglifier
- jquery-rails
- jbuilder
- bootsnap
- font-awesome-sass
- carrierwave
- mini_magick
- devise
- haml-rails
- erb2haml
- font-awesome-sass
- fog-aws
- active_hash
- ancestry
- gretel
- twilio-ruby
- phony_rails
- dotenv-rails
- payjp
- omniauth
- omniauth-google-oauth2
- omniauth-facebook
- omniauth-rails_csrf_protection

### development, test
- byebug
- capistrano
- capistrano-rbenv
- capistrano-bundler
- capistrano-rails
- capistrano3-unicorn
- pry-rails
- rspec-rails
- rails-controller-testing
- factory_bot_rails
- faker
- forgery_ja

### development
- web-console
- listen
- spring
- spring-watcher-listen
- spring-commands-rspec

### production
- unicorn

---

## Deployment instructions
- Build on AWS(EC2 & S3)
