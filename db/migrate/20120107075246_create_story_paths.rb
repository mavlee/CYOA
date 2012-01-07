class CreateStoryPaths < ActiveRecord::Migration
  def change
    create_table :story_paths do |t|
      t.string :title, :null => false
      t.string :content, :null => false
      
      t.timestamps
    end
  end
end
