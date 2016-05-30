class RemoveClassicColumnFromContent < ActiveRecord::Migration
  def change
    remove_column :contents, :classic, :boolean
    rename_column :contents, :equitable, :type
  end
end
