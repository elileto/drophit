class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :gender
      t.integer :weight
      t.integer :height
      t.date :date_of_birth
      t.timestamps
    end
  end
end
