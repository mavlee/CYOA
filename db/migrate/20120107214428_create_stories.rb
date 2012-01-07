class CreateStories < ActiveRecord::Migration
  def change
    puts "WTF"
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
