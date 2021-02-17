# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_jpn    | string | null: false |
| first_name_jpn     | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one  :shipping_address

## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| name             | string     | null: false |
| item_info        | text       | null: false |
| item_id          | integer    | null: false |
| item_id          | integer     | null: false |
| item_id          | integer     | null: false |
| item_id          | integer     | null: false |
| item_id          | integer     | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :category, :status, :shipping_fee, :prefecture, :schedule
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column           | Type    | Options     |
| ------           | --------| ------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## shipping_address テーブル

| Column      | Type    | Options     |
| --------    | ------  | ----------- |
| postal_code | string  | null: false |
| item_id     | integer | null: false |
| city_name   | string  | null: false |
| address_num | string  | null: false |
| building    | string  | null: false |
| phone_num   | string  | null: false |


### Association

- belongs_to :user
- has_many   :items
- has_many   :purchases