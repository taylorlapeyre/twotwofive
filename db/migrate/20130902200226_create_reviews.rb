class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :name
      t.integer :user_id
      t.integer :apartment_id

      t.timestamps
    end
  end
end
