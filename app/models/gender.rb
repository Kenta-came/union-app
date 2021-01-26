class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '男' },
    { id: 3, name: '女' },
    { id: 4, name: 'その他' }
  ]
  include ActiveHash::Associations 
  has_many :profiles
  end