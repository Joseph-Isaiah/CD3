class AddDetailsToCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :calls, :details, :jsonb
  end
end
