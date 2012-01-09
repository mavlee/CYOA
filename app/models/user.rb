class User < ActiveRecord::Base
  has_many :story_nodes

  def self.authenticate?(username)
    find_by_username username
  end
end
