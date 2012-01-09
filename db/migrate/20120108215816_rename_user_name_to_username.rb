class RenameUserNameToUsername < ActiveRecord::Migration
  def up
    rename_column :users, :user_name, :username
  end

  def down
    rename_column :users, :username, :user_name
  end
end
