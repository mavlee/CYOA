class StoryNode < ActiveRecord::Base
  belongs_to :story
  has_many :story_branches, :class_name => "StoryBranch",
           :foreign_key => :from_node_id
  has_many :branches, :through => :story_branches, :source => :to_node
  has_many :previous_story_branches, :class_name => "StoryBranch",
           :foreign_key => :to_node_id
  has_many :previous_branches, :through => :previous_story_branches, :source => :from_node
end
