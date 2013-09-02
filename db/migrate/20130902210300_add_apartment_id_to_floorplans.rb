class AddApartmentIdToFloorplans < ActiveRecord::Migration
  def change
    add_column :floorplans, :apartment_id, :integer
  end
end
