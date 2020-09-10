# README

# アプリケーション名　　
My Closet〜クローゼットの見える化しませんか？〜

# 概要
自分が持っているファッションアイテムの登録ができます。

# URL
後日記載予定

# テスト用アカウント
後日記載予定

# 利用方法
後日記載予定

# 目指した課題解決
「買い物に行ったけど、手持ちの服を思い出せずに結局何も買わずに帰ってしまった」  
「同じようなアイテムを買ってしまった」  
家にいなくてもクローゼットの中身が確認できるようなれば、そういった悩みが解決できると思いました。  

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
