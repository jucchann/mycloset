# README

# アプリケーション名
- My Closet　「クローゼットの見える化しませんか？」

# テーブル設計

## Users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association
- has_many :items

## Items テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| price         | integer    |                                 |
| purchase_date | date       |                                 |
| memo          | text       |                                 |
| user_id       | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to_active_hash :category, null: false
- belongs_to_active_hash :brand, null: false
- belongs_to_active_hash :color
- belongs_to_active_hash :size
