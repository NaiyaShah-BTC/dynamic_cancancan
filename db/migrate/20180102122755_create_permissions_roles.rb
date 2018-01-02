class CreatePermissionsRoles < ActiveRecord::Migration[5.1]
  def up
    create_table :permissions_roles do |t|
      t.integer :permission_id
      t.integer :role_id
    end
  end

  def down
    drop_table :permissions_roles
  end
end
