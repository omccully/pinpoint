class CreatePanicSignals < ActiveRecord::Migration[5.0]
  def change
    create_table :panic_signals do |t|
      t.integer :device_id

      t.timestamps
    end
  end
end
