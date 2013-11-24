source 'https://rubygems.org'
ruby '2.0.0'

# Core
gem 'rails', '4.0.0'
gem 'protected_attributes'
gem 'pg'
gem 'thin'
# gem 'turbolinks'
# gem 'jbuilder', '~> 1.2'

# Views
gem 'haml-rails'
gem 'simple_form'
gem 'kaminari', '~> 0.14.1'

# Assets
gem 'less-rails', '~> 2.4.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'less-rails-bootstrap', '~> 3.0.2'
gem 'therubyracer', :platform=>:ruby
gem 'jquery-ui-rails', '~> 4.1.0'
gem 'backbone-on-rails'
gem "font-awesome-rails"

# Authentication & Authorization
#gem 'devise'
gem 'cancan'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'rolify'

# Currency
gem 'google_currency', '~> 3.0.0'
gem 'money-rails', '~> 0.8.1'

# Tools
gem 'figaro' # Environment variables
gem 'state_machine', '~> 1.2.0' # States
gem 'carrierwave', '~> 0.9.0' # Photo uploads
gem 'localized_country_select', '~> 0.9.2' # Select countries
gem 'tire' # Elasticsearch

# Validations
gem 'validates_email_format_of', '~> 1.5.3'
gem 'validates_existence', '~> 0.8.0', github: 'perfectline/validates_existence', ref: 'e6fe0854c7e60e4b0cdc7f49f70cd2bc051e0bc1'

# Social
gem 'koala'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'hub', :require=>nil
  gem 'hirb', '~> 0.7.1'
  gem 'quiet_assets'
  gem 'meta_request'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'debugger'
  gem 'faker', '~> 1.2.0'
  gem 'listen', '~> 1.3.1' # Temporary patch should be "gem 'listen', '~> 2.1.1'"
  gem 'guard-rspec', '~> 3.1.0' # Temporary patch should be "gem 'guard-rspec', '~> 4.0.3'"
  gem 'rspec-rails', '~> 2.14.0'
  gem 'guard-spork', '~> 1.5.1'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'spork-rails', '~> 4.0.0'
end

group :development, :production do
  gem 'newrelic_rpm'
  gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
end
