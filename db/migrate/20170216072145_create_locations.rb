class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.text :nmea

      t.timestamps
    end
  end
end
