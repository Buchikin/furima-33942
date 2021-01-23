class Item < ApplicationRecord
  
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, numericality: { :greater_than_or_equal_to => 300 , :less_than_or_equal_to => 9999999 , message:"must be 300~9999999" }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}
    validates :price, numericality: { only_integer: true, message: "must be Integer"}

    with_options numericality: { other_than: 0 , message: "must be selected"} do
      validates :category_id
      validates :condition_id
      validates :charge_id
      validates :prefecture_id
      validates :ship_day_id
    end
  end
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :ship_day

end
