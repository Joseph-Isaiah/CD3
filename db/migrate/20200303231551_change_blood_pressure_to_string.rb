class ChangeBloodPressureToString < ActiveRecord::Migration[5.2]
  def change
    change_column :calls, :blood_pressure, :string
  end
end
