class AddPublicToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :public, :boolean, default: false
  end
end
