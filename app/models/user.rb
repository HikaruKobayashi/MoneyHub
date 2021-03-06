class User < ApplicationRecord
  has_many :incomes, dependent: :destroy
  has_many :deposits, dependent: :destroy
  has_many :variable_costs, dependent: :destroy
  has_many :fixed_costs, dependent: :destroy

  # ハッシュ化したパスワードで認証ができるようにする。
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
end
