class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze  #半角英数どちらも含む
  validates_format_of :password, with: PASSWORD_REGEX, message: "must be included both letter(Half-width) and number"

  with_options presence: true do
    validates :nickname
    validates :birth_day

    with_options format: { with: /\A[ぁ-んァ-ヶー一-龥]+\z/, message: "must be Full-width characters"} do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/, message: "must be Full-width katkana characters"} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  has_many :items
end
