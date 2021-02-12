class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # フォロー機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  # フォロー機能

  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :gender
  belongs_to :form
  has_one_attached :image
  
  

  # メッセージ機能
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  # メッセージ機能
  
  # 検索機能
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['profession_name LIKE ?', "%#{search}%"])
    else
      User.all #全て表示。
    end
  end 
  # 検索機能

end
