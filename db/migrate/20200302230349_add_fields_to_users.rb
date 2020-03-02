class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :unit, :string
    add_reference :users, :hospital, foreign_key: true
  end
end
