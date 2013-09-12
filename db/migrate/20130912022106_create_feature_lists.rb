class CreateFeatureLists < ActiveRecord::Migration
  def change
    create_table :feature_lists do |t|
      t.integer :floorplan_id
      t.boolean :alarm_system
      t.boolean :cats_allowed
      t.boolean :central_air
      t.boolean :covered_parking
      t.boolean :deck_patio
      t.boolean :dishwasher
      t.boolean :dogs_allowed
      t.boolean :elevator
      t.boolean :fireplace
      t.boolean :hardwood_floors
      t.boolean :new_appliances
      t.boolean :on_street_parking
      t.boolean :parking_garage
      t.boolean :private_garage
      t.boolean :private_yard
      t.boolean :reserved_parking
      t.boolean :shared_yard
      t.boolean :vaulted_ceilings
      t.boolean :walk_in_closet
      t.boolean :washer_dryer
      t.boolean :wifi_included

      t.timestamps
    end
  end
end
