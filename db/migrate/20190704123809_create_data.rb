class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.string :devise
      t.string :PM2_5
      t.string :PM10
      t.integer :feeling
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
