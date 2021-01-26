class Order
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :house_num, :building, :phone_num 

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "must be Half-width numbers and included hyphen(-)" }
    validates :prefecture, numericality: { other_than: 0, message: "must be selected" }
    validates :city
    validates :house_num
    validates :phone_num, numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}
  end

end