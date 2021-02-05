# テーブル設計

## usersテーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| nickname            | string     | null: false |
| email               | string     | null: false |
| encrypted_password  | string     | null: false |
| first_name          | string     | null: false |
| last_name           | string     | null: false |
| first_name_reading  | string     | null: false |
| last_name_reading   | string     | null: false |
| birthday            | date       | null: false |

### Association
- has_many :items
- has_one :user_items

## itemsテーブル
| Column       | Type       | Options     |
| -------------| ---------- | ----------- |
| name         | string     | null: false |
| description  | text       | null: false |
| category_id  | integer    | null: false |
| condition_id | integer    | null: false |
| shipping_id  | integer    | null: false |
| area_id      | integer    | null: false |
| day_id       | integer    | null: false |
| price        | integer    | null: false |
| user         | references |             |

### Association
- has_many :user_items
- belongs_to :user

## user_itemsテーブル
| Column       | Type       | Options     |
| -------------| ---------- | ----------- |
| user         | references |             |
| item         | references |             |

### Association
- has_one :users

## addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal        | string     | null: false |
| prefectures   | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone         | string     | null: false |