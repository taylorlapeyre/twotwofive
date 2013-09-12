class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.integer :landlord_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
