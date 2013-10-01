class AddListingIdAndFloorplanIdToImage < ActiveRecord::Migration
  def change
  	add_column :image, :listing_id, :integer
  	add_column :image, :floorplan_id, :integer
  end
end
