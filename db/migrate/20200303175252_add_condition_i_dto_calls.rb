class AddConditionIDtoCalls < ActiveRecord::Migration[5.2]
  def change
    add_reference :calls, :condition, foreign_key: true
  end
end
