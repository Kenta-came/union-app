class Profile < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :gender
  belongs_to :form
  has_one_attached :image
end