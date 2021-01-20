class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze  #半角英数どちらも含む
  validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers"

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/, message: "Full-width characters"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/, message: "Full-width characters"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katkana characters"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katkana characters"}
  validates :birth_day, presence: true


end
