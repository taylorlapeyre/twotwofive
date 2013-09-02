class CreateFloorplans < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|
      t.string :name
      t.integer :num_bathrooms
      t.integer :num_bedrooms
      t.integer :rent
      t.string :rent_type
      t.integer :square_footage

      t.timestamps
    end
  end
end
