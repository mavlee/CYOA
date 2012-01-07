class CreateStoryBranches < ActiveRecord::Migration
  def change
    create_table :story_branches do |t|
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
