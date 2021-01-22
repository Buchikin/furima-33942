class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :info
    validates :price, numericality: { :greater_than_or_equal_to => 300 , :less_than_or_equal_to => 9999999 , message:"Out of setting range" }, format: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :ship_day_id
  end
  
  belongs_to :user

end
