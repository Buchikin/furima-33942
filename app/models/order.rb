class Order
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :house_num, :building, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "must be Half-width numbers and included hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "must be selected" }
    validates :city
    validates :house_num
    validates :phone_num, numericality: { with: /\A[0-9]{,11}+\z/, message: "must be Half-width numbers and 11 digits or less"}
    validates :token
    validates :user_id
    validates :item_id

  end



  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end

end