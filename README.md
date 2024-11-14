# データベース設計

## users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association

* has_many :blogs
* has_many :comments
* has_many :memos

## blogs table

| Column  | Type       | Options                        |
|-------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| title   | string     | null: false                    |
| tag     | string     | null: false                    |
| content | text       | null: false                    |
| image   | string     |                                |

### Association

* belongs_to :user
* has_many :comments

## comments table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| blog    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :blog

## memos table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| memo      | text       | null: false                    |
| label     | string     | null: false                    |
| work_date | string     | null: false                    |

### Association

* belongs_to :user