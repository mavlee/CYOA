class StoryBranch < ActiveRecord::Base
  belongs_to :from_node, :class_name => "StoryNode", :foreign_key => :from_node_id
  belongs_to :to_node,   :class_name => "StoryNode", :foreign_key => :to_node_id
end
