class AddUserToStoryNodes < ActiveRecord::Migration
  def change
    add_column :story_nodes, :author_id, :integer
  end
end
