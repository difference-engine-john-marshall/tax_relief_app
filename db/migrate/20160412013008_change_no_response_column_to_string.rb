class ChangeNoResponseColumnToString < ActiveRecord::Migration
  def change
    change_column :questions, :no_response, :string
  end
end
