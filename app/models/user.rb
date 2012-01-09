class User < ActiveRecord::Base
  def self.authenticate?(username)
    find_by_username username
  end
end
