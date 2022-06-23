# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | binary     | null: false                    |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| status_info      | string     | null: false                    |
| shipping_charges | integer    | null: false                    |
| shipping_area    | string     | null: false                    |
| days_to_ship     | string     | null: false                    |
| price            | integer    | null: false                    |
| seller           | references | null: false, foreign_key: true |
| buyer            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :shipping_address
- has_one    :purchase_record


## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street_no     | string     | null: false                    |
| phone_no      | integer    | null: false                    |
| building_name | string     |                                |
| buyer         | references | null: false, foreign_key: true |

### Association
- belongs_to :item

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | references | null: false, foreign_key: true |
| buyer  | references | null: false, foreign_key: true |

### Association
- belongs_to :item