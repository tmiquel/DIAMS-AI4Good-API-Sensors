class CreateLastData < ActiveRecord::Migration[5.2]
  def change
    create_table :last_data do |t|
      t.string :devise
      t.string :PM2_5
      t.string :PM10
      t.integer :positive_feeling
      t.integer :mixed_feeling
      t.integer :negative_feeling
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
