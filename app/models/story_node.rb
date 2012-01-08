class StoryNode < ActiveRecord::Base
  belongs_to :story
  has_many :story_branches
end
