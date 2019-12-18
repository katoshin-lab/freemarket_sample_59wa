# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

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
|is_identificated|boolean|null: false, default: false|
|profile|text||
### Associations
- has_one :user_address
- has_one :user_real_name
- has_one :user_delivery
- has_many :user_payments
- has_many :likes
- has_many :reports
- has_many :items
- has_many :dealing_items
- has_many :bought_items

## user_addresses table
|Column|Type|Options|
|------|----|-------|
|postal_number|integer|null: false|
|prefecture|references|null: false, foreign_key: true, default: 47|
|city|string|null: false, limit: 50|
|block|string|null: false, limit: 50|
|building_name|string|limit: 50|
|phone|integer|limit: 5|
|user|references|null: false, foreign_key: true|
### Associations
- belongs_to_active_hash :prefecture
- belongs_to :user

## user_real_names table
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false, limit: 40|
|first_name|string|null: false, limit: 40|
|last_name_kana|string|null: false, limit: 40|
|first_name_kana|string|null: false, limit: 40|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## user_deliveries table
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false, limit: 40|
|first_name|string|null: false, limit: 40|
|last_name_kana|string|null: false, limit: 40|
|first_name_kana|string|null: false, limit: 40|
|postal_number|integer|null: false|
|prefecture|references|null: false, foreign_key: true, default: 47|
|city|string|null: false, limit: 50|
|block|string|null: false, limit: 50|
|building_name|string|limit: 50|
|phone|integer|limit: 5|
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
|condition|string|null: false, limit: 20|
|price|integer|null: false|
|seller|references|null: false, foreign_key: {to_table: users}|
|is_seller_shipping|boolean|null: false, default: true|
|prefecture|references|null: false, foreign_key: true|
|shipping_period|references|null: false, foreign_key: true|
|shipping_method|references|null: false, foreign_key: true|
|brand|references|foreign_key: true|
|category|references|null: false, foreign_key: true|
|item_status|integer|null: false, limit: 1|
### Associations
- belongs_to :user
- has_many :images
- has_many :likes
- has_many :reports
- belongs_to :brand
- belongs_to :shipping_method
- belongs_to :shipping_period
- belongs_to :category
- has_many :dealing_comments
- belongs_to_active_hash :prefecture

## dealing_comments table
|Column|Type|Options|
|------|----|-------|
|buyer|references|null: false, foreign_key: {to_table: user}|
|item|references|null: false, foreign_key: true|
|text|text|null: false|
### Associations
- belongs_to :user
- belongs_to :item

## likes table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Associations
- belongs_to :user
- belongs_to :item

## shipping_periods table
|Column|Type|Options|
|------|----|-------|
|period|string|limit: 20|
### Association
- has_many :items

## shipping_methods table
|Column|Type|Options|
|------|----|-------|
|shipping_method|string|limit: 30|
### Association
- has_many :items

## images table
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|
### Association
belongs_to :item

## brands table
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 40|
### Association
- has_many :items

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 40|
|ancestry|string|index: true|
### Associations
- has_many :items
- has_ancestry

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
