class Form < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'フリーランス' },
    { id: 3, name: '個人事業主' },
    { id: 4, name: '副業' },
    { id: 5, name: '企業' }
  ]
  include ActiveHash::Associations 
  has_many :users
end
