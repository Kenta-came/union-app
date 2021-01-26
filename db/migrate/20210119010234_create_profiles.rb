class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id,           null: false, foreign_key: true
      t.integer :gender_id,         null: false
      t.integer :form_id,           null: false
      t.string :profession_name,    null: false
      t.string :want_to_do,         null: false
      t.string :can_do_list,        null: false
      t.timestamps
    end
  end
end
