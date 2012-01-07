class AddStartNodeToStories < ActiveRecord::Migration
  def change
    add_column :stories, :start_node, :integer
  end
end
