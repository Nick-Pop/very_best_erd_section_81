class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.integer :dish_id
      t.integer :cuisine_id

      t.timestamps

    end
  end
end
