class AddSuperAdminToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :superadmin, :boolean
  end
end
