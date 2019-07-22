class ChangeColumnNameinLastDatumTable < ActiveRecord::Migration[5.2]
  def change
		rename_column :last_data, :devise, :device
  end
end
