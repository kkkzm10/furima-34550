# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_jpn    | string | null: false |
| first_name_jpn     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| name             | string     | null: false |
| item_info        | text       | null: false |
| category_id      | integer    | null: false |
| status_id        | integer     | null: false |
| shipping_fee_id  | integer     | null: false |
| prefecture_id    | integer     | null: false |
| schedule_id      | integer     | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :category, :status, :shipping_fee, :prefecture, :schedule
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column           | Type    | Options     |
| ------           | --------| ------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル

| Column        | Type    | Options     |
| --------      | ------  | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city_name     | string  | null: false |
| address_num   | string  | null: false |
| building      | string  |             |
| phone_num     | string  | null: false |
| purchase      | references | null: false, foreign_key: true |



### Association

- belongs_to_active_hash :prefecture
- belongs_to :purchase