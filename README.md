# テーブル設計

## usersテーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| first_name        | string | null: false |
| family_name       | string | null: false |
| first_name_kana   | string | null: false |
| family_name_kana  | string | null: false |
| birthday          | date   | null: false |


### Association
- has_many :items
- has_many :buyers

## itemsテーブル

| Column         | Type       | Options                |
| -------------- | ---------- | ---------------------- |
| image          | string     | ActiveStorageで実装    |
| item_name      | string     | null: false            |
| introduction   | text       | null: false            |
| category       | integer    | null: false            |
| condition      | integer    | null: false            |
| payer          | integer    | null: false            |
| area           | integer    | null: false            |
| day            | integer    | null: false            |
| price          | integer    | null: false            |

### Association
- has_one : buyers


## buyersテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| buy_item  | text       | null: false |

### Association
- belongs_to :users
- has_one :items
- has_one :addresses

## addressesテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| shipping_address  | text       | null: false |

### Association
- has_one :buyers