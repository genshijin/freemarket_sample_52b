# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## usersテーブル

|Column|Type|Options| 
|-------|----|-------| 
|Nickname|string|null: false| 
|Email|string|null: false, unique: true| 
|Password|string|null: false, unique: true| 
|FirstName|string|null: false| 
|FirstName_kana|string|null: false| 
|LastName|string|null: false| 
|LastName_kana|string|null: false| 
|BirthYear|string|null: false| 
|BirthMonth|string|null: false| 
|BirthDay|string|null: false| 
|PhoneNumber|integer|null: false,unique: true|
|Profile|text|

### Association 
- belongs_to :creditcard
- belongs_to :address
- has_many :items

## creditcardsテーブル

|Column|Type|Options| 
|-------|----|-------| 
|UserId|references|null: false,foreign_key: true|
|CardNumber|integer|null: false| 
|ExpirationDate|string|null: false| 

### Association 
- belongs_to :user

## addressesテーブル

|Column|Type|Options| 
|-------|----|-------| 
|UserId|references|null: false,foreign_key: true|
|PostalCode|integer|null: false|
|Prefectures|string|null: false|
|Cities|string|null: false|
|Address|string|null: false|
|BuildingName|string|null: false|

### Association 
- belongs_to :user

## itemsテーブル

|Column|Type|Options| 
|-------|----|-------| 
|BuyerId|references|null: false|
|SellerId|references|null: false,foreign_key: true|
|CategoryId|references|null: false,foreign_key: true|
|Name|string|null: false|
|Comment|text|null: false|
|Price|integer|null: false|
|State|string|null: false|
|Postage|integer|null: false|
|ShippingDate|string|null: false|
|ShippingWay|string|null: false|


### Association 
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :category
- has_many: images

## imagesテーブル

|Column|Type|Options| 
|-------|----|-------| 
|ItemId|references|null: false,oreign_key: true|
|image|string|null: false|

### Association 
- belongs_to: item

## categoriesテーブル

|Column|Type|Options| 
|-------|----|-------| 
|Name|string|null: false|
|Ancestry|string|

### Association 
- belongs_to: category_option
- has_many: item
- has_ancestry

## category_optionsテーブル

|Column|Type|Options| 
|-------|----|-------| 
|CategoryId|references|null: false,oreign_key: true|
|Size|string|null: false|
|Brand|string|null: false|

### Association 
- belongs_to: category
