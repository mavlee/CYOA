class DropStorypath < ActiveRecord::Migration
  def up
    drop_table :story_paths
    drop_table :storypaths
  end

  def down
  end
end
