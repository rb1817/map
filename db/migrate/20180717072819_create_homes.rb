class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      t.string :area_name
      t.string :latitude
      t.string :longitude
      t.string :area_catagory
      t.string :statute
      t.integer :penalty
      t.string :address

      t.timestamps
    end
  end
end
