class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :restaurant_name
      t.string :neighborhood
      t.string :venue_details
      t.string :address
      t.integer :neighborhoods_id

      t.timestamps

    end
  end
end
