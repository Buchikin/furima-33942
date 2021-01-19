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
| password | string | null: false |
| nickname | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_day | string | null: false |
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
| user_id | references | null: false, foreign_key: true |
| category_id | references | null: false, foreign_key: true |
| condition_id | references | null: false, foreign_key: true |
| charge_id | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |
| ship_day_id | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :purchase
- belongs_to :prefecture
- belongs_to :catgory
- belongs_to :condition
- belongs_to :charge
- belongs_to :ship_day

</br>

## purchases Table
| Column | Type | Options |
| - | - | - |
| card_num | integer | null: false |
| card_valid_month | integer | null: false |
| card_valid_day | integer | null: false |
| card_security | integer | null: false |
| zip | string | null: false |
| prefecture_id | references | null: false, foreign_key: true |
| city | string | null: false |
| house_num | string | null: false |
| building | string | - |
| phone_num | string | null: false |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- belongs_to :prefecture

</br>

## prefectures Table
| Column | Type | Options |
| - | - | - |
| prefecture | string | null: false |
### Association
- has_many :items
- has_many :purchases

</br>


## categories Table
| Column | Type | Options |
| - | - | - |
| category | string | null: false |
### Association
- has_many :items

</br>

## conditions Table
| Column | Type | Options |
| - | - | - |
| condition | string | null: false |
### Association
- has_many :items

</br>

## charges Table
| Column | Type | Options |
| - | - | - |
| charge | string | null: false |
### Association
- has_many :items

</br>

## ship_days Table
| Column | Type | Options |
| - | - | - |
| ship_day | string | null: false |
### Association
- has_many :items

</br>
</br>
</br>



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
