class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :content
      t.references :profile, null: false, foreign_key: true
      t.timestamps
    end
  end
end
