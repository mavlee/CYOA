class AddStoryIdToStoryNode < ActiveRecord::Migration
  def change
    add_column :story_nodes, :story_id, :integer
  end
end
