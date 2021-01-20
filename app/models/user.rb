class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze  #半角英数どちらも含む
  validates_format_of :encrypted_password, with: PASSWORD_REGEX

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]/+\z }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]/+\z }
  validates :birth_day, presence: true


end