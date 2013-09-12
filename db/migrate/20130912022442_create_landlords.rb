class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :email
      t.string :password
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :contact_phone

      t.timestamps
    end
  end
end
