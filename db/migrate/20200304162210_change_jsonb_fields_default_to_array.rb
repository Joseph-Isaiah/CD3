class ChangeJsonbFieldsDefaultToArray < ActiveRecord::Migration[5.2]
  def up
    Condition.where(fields: nil).update(fields: {})
    Call.where(details: nil).update(details: {})

    change_column :conditions, :fields, :jsonb, default: {}, null: false
    change_column :calls, :details, :jsonb, default: {}, null: false
  end

  def down
    change_column :conditions, :fields, :jsonb
    change_column :calls, :details, :jsonb
  end
end
