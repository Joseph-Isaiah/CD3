class AddCriticalToCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :calls, :critical, :boolean, null: false, default: false
  end
end
