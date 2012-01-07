class CreateStorypaths < ActiveRecord::Migration
  def change
    create_table :storypaths do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
