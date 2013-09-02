class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :zipcode
      t.string :phone_number
      t.string :website_url
      t.boolean :featured
      t.string :slug
      t.string :geocode

      t.timestamps
    end
  end
end
