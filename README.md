# README

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Associtation
- has_many :items
- has_many :purchases

## items テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| fee_id      | integer    | null: false                    |
| region_id   | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| price       | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

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