source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3', '1.3.4', :group => :development
#gem "autotest", "~> 4.4.6"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'requirejs-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
	gem 'pg'
end

group :development do
  gem 'rspec-rails', '2.7.0'
  gem 'annotate', '2.4.0'
end

group :test do
  # Pretty printed test output
  	gem 'turn', :require => false
	gem 'rspec-rails', '2.7.0'
	gem 'webrat', '0.7.1'
	gem 'factory_girl_rails', '1.0'
end

gem 'acts_as_commentable'
