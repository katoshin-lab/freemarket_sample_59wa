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
|password|string|null: false, limit: 128|
|email|string|null: false, unique: true, limit: 256|
|user_identify_info|references|null: false, foreign_key: true, unique: true|
|birthday|date|null: false|
|is_identificated|boolean|null: false, default: false|
|user_address|references|null: false, foreign_key: true|
|user_real_name|references|null: false, foreign_key: true|
|user_delivery|references|null: false, foreign_key: true|
|user_payment|references|null: false, foreign_key: true|
|profile|text||

## user_addresses table
|Column|Type|Options|
|------|----|-------|
|postal_number|integer|null: false|
|prefecture|references|null: false, foreign_key: true, default: 47|
|city|string|null: false, limit: 50|
|block|string|null: false, limit: 50|
|building_name|string|limit: 50|
|phone|integer|limit: 5|

## user_real_names table
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false, limit: 40|
|first_name|string|null: false, limit: 40|
|last_name_kana|string|null: false, limit: 40|
|first_name_kana|string|null: false, limit: 40|

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

## user_payments table
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|

## items table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 80|
|detail|text|null: false|
|main_image|string|null: false|
|condition|string|null: false, limit: 20|
|price|integer|null: false|
|seller|references|null: false, foreign_key: {to_table: users}|
|is_seller_shipping|boolean|null: false, default: true|
|shipping_origin|references|null: false, foreign_key: {to_table: prefectures}|
|shipping_period|references|null: false, foreign_key: true|
|shipping_method|references|null: false, foreign_key: true|
|brand|references|foreign_key: true|
|category|references|foreign_key: true|
|subcategory|references|foreign_key: true|
|sub_subcategory|references|foreign_key: true|

## other_images table
|Column|Type|Options|
|------|----|-------|
|image1|string||
|image2|string||
|image3|string||
|image4|string||
|image5|string||
|image6|string||
|image7|string||
|image8|string||
|image9|string||
|item|references|foreign_key: true|

## on_sale_items table
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|

## dealing_items table
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: {to_table: users}|

## dealing_comments table
|Column|Type|Options|
|------|----|-------|
|dealing_item|references|null: false, foreign_key: true|
|text|text|null: false|

## bought_items table
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: {to_table: users}|

## likes table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

## shipping_periods table
|Column|Type|Options|
|------|----|-------|
|period|string|limit: 20|

## shipping_methods table
|Column|Type|Options|
|------|----|-------|
|method|string|limit: 30|

## brands table
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 40|

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 40|

## subcategories table
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 40|
|category|references|foreign_key: true|

## sub_subcategories table
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 40|
|sub_category|references|foreign_key: true|

## prefectures table
|Column|Type|Options|
|------|----|-------|
|name|string|limit: 8|

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
