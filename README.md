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
| name           | string     | null: false                    |
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
- belongs_to : user


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
| post_code         | string           | null: false                    |
| area_id           | integer          | null: false                    |
| city              | string           | null: false                    |
| house_number      | string           | null: false                    |
| house_name        | string           |                                |
| phone_number      | string           | null: false                    |
| buyer             | references       | null: false ,foreign_key: true |


### Association
- belongs_to :buyer