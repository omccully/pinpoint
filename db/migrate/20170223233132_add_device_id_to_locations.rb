class AddDeviceIdToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :device_id, :integer
  end
end
