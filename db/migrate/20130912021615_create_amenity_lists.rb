class CreateAmenityLists < ActiveRecord::Migration
  def change
    create_table :amenity_lists do |t|
      t.integer :listing_id
      t.boolean :basketball_court
      t.boolean :club_house
      t.boolean :game_room
      t.boolean :gated_community
      t.boolean :gym
      t.boolean :handicap_accessible
      t.boolean :media_center
      t.boolean :pool
      t.boolean :public_bus_route
      t.boolean :spa
      t.boolean :storage_space
      t.boolean :tanning_bed
      t.boolean :tennis_court
      t.boolean :university_bus_route
      t.boolean :volleyball_court

      t.timestamps
    end
  end
end
