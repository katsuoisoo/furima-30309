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
| item                | references |             |

### Association
- has_many :user_items
- has_many :comments

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
- has_many :comments

## user_itemsテーブル
| Column       | Type       | Options     |
| -------------| ---------- | ----------- |
| user         | references |             |
| item         | references |             |

### Association
- has_many :users
- has_many :items

## commentsテーブル
| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| text       | text       | null: false       |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item