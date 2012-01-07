class CreateStoryNodes < ActiveRecord::Migration
  def change
    create_table :story_nodes do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
