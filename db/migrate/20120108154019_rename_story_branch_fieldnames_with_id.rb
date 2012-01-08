class RenameStoryBranchFieldnamesWithId < ActiveRecord::Migration
  def up
    rename_column :story_branches, :from_node, :from_node_id
    rename_column :story_branches, :to_node,   :to_node_id
  end

  def down
    rename_column :story_branches, :from_node_id, :from_node
    rename_column :story_branches, :to_node_id,   :to_node
  end
end
