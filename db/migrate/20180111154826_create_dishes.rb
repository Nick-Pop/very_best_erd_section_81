class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :type_of_food
      t.string :restaurant_location
      t.string :dish_details
      t.integer :cuisine_id

      t.timestamps

    end
  end
end
