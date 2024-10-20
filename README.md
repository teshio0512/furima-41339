# README

## users テーブル
| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| password_confirmation | string  | null: false               |
| family_name           | string  | null: false               |
| first_name            | string  | null: false               |
| kana_family_name      | string  | null: false               |
| kana_first_name       | string  | null: false               |
| birthyear_id          | integer | null: false               |
| birthmonth_id         | integer | null: false               |
| birthday_id           | integer | null: false               |

### Associtation
- has_many :items
- has_many :purchases

## items テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| fee_id      | integer    | null: false                    |
| region_id   | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| price       | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer_id   | references | null: false, foreign_key: true |
| item _id   | references | null: false, foreign_key: true |
| card_token | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | string  | null: false |
| prefecture_id  | integer | null: false |
| city           | string  | null: false |
| street_address | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |

### Association
- belongs_to :purchase