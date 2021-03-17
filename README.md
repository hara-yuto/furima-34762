# テーブル設計

## usersテーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | -----------               |
| nickname          | string | null: false               |
| email             | string | null: false , unique:true |
| encrypted_password| string | null: false               |
| first_name        | string | null: false               |
| family_name       | string | null: false               |
| first_name_kana   | string | null: false               |
| family_name_kana  | string | null: false               |
| birthday          | date   | null: false               |


### Association
- has_many :items
- has_many :buyers

## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| introduction   | text       | null: false                    |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| payer_id       | integer    | null: false                    |
| area_id        | integer    | null: false                    |
| day_id         | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- has_one : buyer


## buyersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column            | Type             | Options                        |
| ----------------- | ---------------- | ------------------------------ |
| post_code         | text             | null: false                    |
| prefecture_id     | integer          | null: false                    |
| city              | text             | null: false                    |
| house_number      | text             | null: false                    |
| house_name        | text             |/                               |
| phone_number      | text             | null: false                    |
| buyer             | references       | null: false ,foreign_key: true |


### Association
- belongs_to :buyer