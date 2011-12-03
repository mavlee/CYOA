# By using the symbol ':user', we get Factory Girl to simulate the User Model/Create the User Model in the db
Factory.define :user do |user|
  user.full_name   "Michael Hartl"
  user.username    "mk2"
  user.email       "mhartl@example.com"
  user.pw          "foobar1"
end