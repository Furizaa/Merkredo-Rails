source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'active_model_serializers', git: 'https://github.com/rails-api/active_model_serializers.git'

gem 'pg'
gem 'fast_xor', git: 'git://github.com/CodeMonkeySteve/fast_xor.git'
gem 'ri_cal', git: 'https://github.com/Furizaa/ri_cal.git'

#we had issues with latest, stick to the rev till we figure this out
# PR that makes it all hang together welcome
gem 'ember-rails', git: 'git://github.com/emberjs/ember-rails.git', ref: '57bbe32'
gem 'barber', '0.3.0'
gem 'ember-source', '1.0.0.rc3.3'

gem 'font-awesome-sass-rails', '~> 3.0.2.2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
end

group :test, :development do
  gem 'guard'
  gem 'guard-jshint-on-rails'
  gem 'guard-livereload'
  gem 'rb-fsevent'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'fabrication'
  gem 'seed-fu'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
