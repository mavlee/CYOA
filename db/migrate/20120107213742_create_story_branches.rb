class CreateStoryBranches < ActiveRecord::Migration
  def change
    create_table :story_branches do |t|
      t.integer :from_node
      t.integer :to_node

      t.timestamps
    end
  end
end
