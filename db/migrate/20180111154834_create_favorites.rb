class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :dishes_id
      t.integer :venues_id
      t.integer :user_id

      t.timestamps

    end
  end
end
