class AlterUsers < ActiveRecord::Migration[5.0]
  # when caught in a half-state migration (errors preventing a complete up or down migration)
  # an alternative to an 'SQL DROP TABLE' is to comment out the lines stopping the progression
  # to the desired state. then once successfully migrated, the lines can be uncommented and
  # an complete up/down cycle can be run to ensure migration code is correct. 

  def up
    rename_table("users", "admin_users")
    add_column("admin_users", "username", :string, :limit => 25, :after => "email")
    change_column("admin_users", "email", :string,:limit => 100)
    rename_column("admin_users", "password", "hashed_password")
    puts "*** Adding an Index ***"
    add_index("admin_users", "username")
  end

  def down
    remove_index("admin_users", "username")
    rename_column("admin_users", "hashed_password", "password")
    change_column("admin_users", "email", :string,:default => '', :nul => false)
    remove_column("admin_users", "username")
    rename_table("admin_users", "users")
  end
end
