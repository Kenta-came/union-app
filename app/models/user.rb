class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
       

  has_many :profiles
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, format: { with: /[@]/ , message: 'メールアドレスに「＠」を挿入してください！'}

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i ,message: '半角英数字を混合してください！'} do
      validates :password
    end
  end
end
