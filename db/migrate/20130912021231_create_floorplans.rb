class CreateFloorplans < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|
      t.integer :listing_id
      t.string :name
      t.integer :num_bathrooms
      t.integer :num_bedrooms
      t.integer :rent
      t.string :rent_type
      t.integer :square_footage
      t.integer :deposit
      t.integer :lease_term
      t.string :lease_type
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
