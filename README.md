# README
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


## usersテーブル
| Column          | Type       | Options                   |
| --------------- | ---------- | ------------------------- |
| nickname        | string     | null: false               |
| email           | string     | null: false, unique: true |
| password        | string     | null: false               |
| first_name      | string     | null: false               |
| first_name_kana | string     | null: false               |
| last_name       | string     | null: false               |
| last_name_kana  | string     | null: false               |
| birth_year      | integer    | null: false               |
| birth_month     | integer    | null: false               |
| birth_day       | integer    | null: false               |
| phone_number    | string     | null: false, unique: true |
| profile         | text       |                           |
| saling_items    | references |                           |
| buyed_items     | references |                           |
| sold_items      | references |                           |

### Association
- has_one :creditcard
- has_many :addresses
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"


## creditcardsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| customer_id     | string     | null: false                    |
| card_id         | string     | null: false                    |

### Association
- belongs_to :user


## addressesテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| first_name      | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name       | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| postal_code     | string    | null: false                    |
| prefectures     | string     | null: false                    |
| cities          | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |
| phone_number    | string     |
### Association
- belongs_to :user


## itemsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buyer_id      | references |                                |
| seller_id     | references | null: false, foreign_key: true |
| category_id   | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| comment       | text       | null: false                    |
| price         | integer    | null: false                    |
| state_id         | integer     | null: false                |
| postage_burden_id| integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| shipping_origin_area_id  | integer | null: false                |
| shipping_way_id| integer |


### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :category
- has_many :images


## imagesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| image   | string     | null: false                    |

### Association
- belongs_to :item


## categoriesテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |

### Association
- has_one :category_option
- has_many :item
- has_ancestry


## category_optionsテーブル
| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| category_id | references | null: false,foreign_key: true |
| size        | string     | null: false                   |
| brand       | string     | null: false                   |

### Association
- belongs_to :category
