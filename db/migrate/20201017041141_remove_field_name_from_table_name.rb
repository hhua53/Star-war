class RemoveFieldNameFromTableName < ActiveRecord::Migration[6.0]
  def change
    remove_column :table_names, :field_name, :datatype
  end
end
