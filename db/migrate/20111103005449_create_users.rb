class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :username
        t.string :pw
    #   # t.string :email
        t.string :full_name
    # 
        t.timestamps
    end
  end
end
