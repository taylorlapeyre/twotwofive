class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :building_name
      t.string :address
      t.string :zip
      t.text :descrption
      t.string :contact_email
      t.string :phone_number
      t.string :website_url
      t.boolean :featured, default: false
      t.string :slug
      t.string :geocode
      t.boolean :active, default: true
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
