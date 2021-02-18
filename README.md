# テーブル設計

## users テーブル

| Column             | Type   | Options            |
| ------------------ | ------ | ------------------ |
| nick_name          | string | null: false, unique|
| email              | string | null: false, unique|
| encrypted_password | string | null: false        |
| birthday           | date   | null: false        |

### Association

- has_many :entries
- has_many :rooms
- has_many :messages
- has_many :blogs
- has_one  :profile

## profiles テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| user_id            | integer | null: false |
| gender_id          | integer | null: false |
| profession_name    | string  | null: false |
| want_to_do         | string  | null: false |
| can_do_list        | string  | null: false |

### Association

- belong_to  :user

## rooms テーブル

| Column      | Type    | Options     |
| ----------- | ------  | ----------- |
| id          | integer | null: false |

### Association

- has_many :entries
- has_many :users
- has_many :messages

## entries テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| letter  | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## blog テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| user_id   | integer | null: false |
| genre_id  | integer | null: false |
| blog_name | string  | null: false |
| text      | text    | null: false |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user_id | integer    |             |
| blog_id | integer    | null: false |
| opinion | text       | null: false |

### Association

- belongs_to :blog

## アプリケーション名
UNION
## アプリケーション概要
スキルシャアができるマッチングアプリ
## URL
デプロイ前で未作成
## テスト用アカウント
アドレス  : gg@gg
パスワード: gggggg0
## 利用方法
テスト用アカウントでログイン後、ユーザーをフォローまたは、メッセージのやり取りを行う。
## 目指した課題解決
フリーランス、個人事業主、副業を行いたい方を繋げることで、その場で仕事が生まれることによって、フリーランス、個人事業主、副業を行いやすくする目的。
## 洗い出した要件
・ユーザー機能
・メッセージ機能
・フォロー機能
・ブログ機能