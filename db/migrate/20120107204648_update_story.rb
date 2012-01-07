class UpdateStory < ActiveRecord::Migration
  def up
    add_column :stories, :category, :string
    rename_column :stories, :content, :description
  end

  def down
  end
end
