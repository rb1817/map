class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :area_type
      t.string :area_name
      t.string :address
      t.string :latitude
      t.string :longitude
      t.string :image_address
      
      t.integer :user_id
      
      t.text :description

      t.timestamps
    end
  end
end
