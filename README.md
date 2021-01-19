# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration


* Database creation

## users Table
| Column | Type | Options |
| - | - | - |
| email | string | null: false |
| encrypted_password | string | null: false |
| nickname | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_day | date | null: false |
### Association
- has_many :items
- has_many :purchases

</br>

## items Table
| Column | Type | Options |
| - | - | - |
| name | string | null: false |
| info | text | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| charge_id | integer | null: false |
| prefecture_id | integer | null: false |
| ship_day_id | integer | null: false |
### Association
- belongs_to :user
- has_one :purchase

</br>

## purchases Table
| Column | Type | Options |
| - | - | - |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |
| zip | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| house_num | string | null: false |
| building | string | - |
| phone_num | string | null: false |
### Association
- belongs_to :user
- belongs_to :item

</br>
</br>
</br>



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
