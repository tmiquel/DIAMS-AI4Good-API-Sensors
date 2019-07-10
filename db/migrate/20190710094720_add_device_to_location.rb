class AddDeviceToLocation < ActiveRecord::Migration[5.2]
  def change
		add_column :locations, :device, :string
  end
end
