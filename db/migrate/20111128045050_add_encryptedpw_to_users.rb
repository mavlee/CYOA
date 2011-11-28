class AddEncryptedpwToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_pw, :string
  end
end
