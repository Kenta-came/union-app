class Profile < ApplicationRecord


  
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :gender
  belongs_to :form
  has_one_attached :image
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy


  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Profile.where(['profession_name LIKE ?', "%#{search}%"])
    else
      Profile.all #全て表示。
    end
  end 

end
