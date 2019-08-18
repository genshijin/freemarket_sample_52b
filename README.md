# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## usersテーブル

|Column|Type|Options| 
|-------|----|-------| 
|nickname|string|null: false| 
|email|string|null: false, unique: true| 
|password|string|null: false| 
|first_name|string|null: false| 
|first_name_kana|string|null: false| 
|last_name|string|null: false| 
|last_name_kana|string|null: false| 
|birth_year|integer|null: false| 
|birth_month|integer|null: false| 
|birth_day|integer|null: false| 
|phone_number|integer|null: false,unique: true|
|profile|text|

### Association 
- has_one :creditcard
- has_one :address
- has_many :items

## creditcardsテーブル

|Column|Type|Options| 
|-------|----|-------| 
|user_id|references|null: false,foreign_key: true|
|card_number|integer|null: false| 
|expiration_date|string|null: false| 

### Association 
- belongs_to :user

## addressesテーブル

|Column|Type|Options| 
|-------|----|-------| 
|user_id|references|null: false,foreign_key: true|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|cities|string|null: false|
|address|string|null: false|
|building_name|string|null: false|

### Association 
- belongs_to :user

## itemsテーブル

|Column|Type|Options| 
|-------|----|-------| 
|buyer_id|references|null: false|
|seller_id|references|null: false,foreign_key: true|
|category_id|references|null: false,foreign_key: true|
|name|string|null: false|
|comment|text|null: false|
|price|integer|null: false|
|state|string|null: false|
|postage|integer|null: false|
|shipping_date|string|null: false|
|shipping_way|string|null: false|


### Association 
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :category
- has_many :images

## imagesテーブル

|Column|Type|Options| 
|-------|----|-------| 
|item_id|references|null: false,foreign_key: true|
|image|string|null: false|

### Association 
- belongs_to :item

## categoriesテーブル

|Column|Type|Options| 
|-------|----|-------| 
|name|string|null: false|
|ancestry|string|

### Association 
- has_one :category_option
- has_many :item
- has_ancestry

## category_optionsテーブル

|Column|Type|Options| 
|-------|----|-------| 
|category_id|references|null: false,oreign_key: true|
|size|string|null: false|
|brand|string|null: false|

### Association 
- belongs_to :category
