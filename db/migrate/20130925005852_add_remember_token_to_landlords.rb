class AddRememberTokenToLandlords < ActiveRecord::Migration
  def change
  	add_column :landlords, :remember_token, :string
    add_index  :landlords, :remember_token
  end
end
