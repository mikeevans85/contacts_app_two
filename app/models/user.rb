class User < ApplicationRecord
  has secure_password
  validates :email, presence: true, uniqueness: true
end
