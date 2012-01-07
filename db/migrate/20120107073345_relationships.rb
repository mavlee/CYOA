class Relationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :story_id, :null => false
      t.string :transition, :null => false
      t.integer :path_id, :null => false

      t.timestamps
    end
  end
end
