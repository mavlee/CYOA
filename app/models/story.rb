class Story < ActiveRecord::Base
  acts_as_commentable
  has_many :story_nodes
end
