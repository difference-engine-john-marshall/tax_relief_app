class AddDefaultFalseToSuperadmin < ActiveRecord::Migration
  def change
        change_column :admins, :superadmin, :boolean, :default => false
  end
end
