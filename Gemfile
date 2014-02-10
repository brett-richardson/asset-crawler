source 'https://rubygems.org'
ruby '2.0.0'

#= Project Base ===
gem 'rails', '4.0.2'
gem 'pg'
gem 'rake'
gem 'bundler'

#= Backend ===
gem 'sidekiq'
gem 'inherited_resources'
gem 'state_machine'
gem 'has_scope'
gem 'nokogiri'
gem 'sinatra'

#= Views ===
gem 'active_link_to'
gem 'simple_form'

#= Utilities ===
gem 'rb-readline'

#= Assets ===
gem 'sass-rails',   '~> 4.0.0' # Use SCSS for stylesheets
gem 'uglifier',     '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'haml-rails'
gem 'turbolinks'   # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'angularjs-rails'
gem 'lodash-rails'
gem 'bootstrap-sass'


#= Production ===

group :production do
  gem 'rails_12factor'
  gem 'papertrail'
end


#= Development & Testing Only ===

group :development do
  gem 'quiet_assets' # Disable assets logs
  gem 'better_errors' # Better development errors
  gem 'binding_of_caller', require: false # Required by better_errors advanced features
  gem 'foreman',           require: false # Procfile support
end

group :development, :test do
  gem 'simplecov', require: false
  gem 'dotenv-rails'
  gem 'teaspoon'
  gem 'pry'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-spork'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'guard-rspec'
  gem 'guard-teaspoon'
  gem 'growl'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
end
