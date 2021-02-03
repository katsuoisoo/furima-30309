# テーブル設計

## usersテーブル
| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_reading       | string | null: false |
| last_reading        | string | null: false |
| birthday            | data | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :cards

## itemsテーブル
| Column       | Type       | Options     |
| -------------| ---------- | ----------- |
| item_name    | string     | null: false |
| description  | text       | null: false |
| category_id  | integer    | null: false |
| condition_id | integer    | null: false |
| shipping_id  | integer    | null: false |
| area_id      | integer    | null: false |
| day_id       | integer    | null: false |
| user         | references |             |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| items      | references |             |

### Association
- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal        | string     | null: false |
| prefectures   | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone         | string     | null: false |
| user          | references |             |
| items         | references |             |

### Association
- belongs_to :user
- belongs_to :item