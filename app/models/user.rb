class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :profiles
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  
end
