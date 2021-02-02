# テーブル設計

## usersテーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| reading   | string | null: false |
| birtthday | string | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :cards

## itemsテーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item_name   | string     | null: false |
| description | text       | null: false |
| category    | string     | null: false |
| condition   | string     | null: false |
| shipping    | string     | null: false |
| area        | string     | null: false |
| day         | string     | null: false |
| user        | references |             |

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

## cardsテーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| number     | string     | null: false |
| expiration | string     | null: false |
| code       | string     | null: false |
| user       | references |             |

### Association
- belongs_to :user
- has_ons :addresses

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

### Association
- belongs_to :card