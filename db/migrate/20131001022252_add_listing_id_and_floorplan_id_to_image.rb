class AddListingIdAndFloorplanIdToImage < ActiveRecord::Migration
  def change
  	add_column :images, :listing_id, :integer
  	add_column :images, :floorplan_id, :integer
  end
end
