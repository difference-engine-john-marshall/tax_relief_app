class ChangeTypeToColumnToString < ActiveRecord::Migration
  def change
      change_column :contents, :type, :string
  end
end
