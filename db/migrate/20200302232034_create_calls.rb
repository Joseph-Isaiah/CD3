class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.string :gender
      t.integer :age
      t.integer :blood_pressure
      t.integer :pulse
      t.float :temperature
      t.float :spa02
      t.references :user, foreign_key: true
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
