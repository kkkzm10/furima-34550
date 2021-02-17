# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :purchase

## items テーブル

| Column       | Type       | Options     |
| ------       | ------     | ----------- |
| name         | string     | null: false |
| item_info    | text       | null: false |
| category     | string     | null: false |
| status       | string     | null: false |
| shipping_fee | string     | null: false |
| prefecture   | string     | null: false |
| schedule     | string     | null: false |
| price        | integer    | null: false |
| item_fee     | integer    | null: false |
| profit       | integer    | null: false |
| user         | references | null: false, foreign_key: true |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase


## purchases テーブル

| Column        | Type    | Options     |
| ------        | --------| ------------|
| card_num      | integer | null: false |
| expiration    | integer | null: false |
| security_code | integer | null: false |
| mail_num      | integer | null: false |
| postal_code   | integer | null: false |
| prefecture    | string  | null: false |
| address       | string  | null: false |
| phone_num     | integer | null: false |

### Association

- belongs_to :user
- has_many :items