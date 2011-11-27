class AddEmailUniquenessIndex < ActiveRecord::Migration
  # Using validates :uniqueness does not guarantee uniqueness.
  # 
  # D’oh! But what can go wrong? Here’s what:
  # 
  # Alice signs up for the sample app, with address alice@wonderland.com.
  # Alice accidentally clicks on “Submit” twice, sending two requests in quick succession.
  # The following sequence occurs: request 1 creates a user in memory that passes validation, request 2 does the same, request 1’s user gets saved, request 2’s user gets saved.
  # Result: two user records with the exact same email address, despite the uniqueness validation.
  # If the above sequence seems implausible, believe me, it isn’t: it happens on any Rails website with significant traffic.21 Luckily, the solution is straightforward to implement; we just need to enforce uniqueness at the database level as well. Our method is to create a database index on the email column, and then require that the index be unique.
  
  def up
    add_index :users, :email, :unique => true
  end

  def down
    remove_index :users, :email
  end
end
