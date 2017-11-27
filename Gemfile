source 'https://rubygems.org'
ruby '2.3.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Use Puma as the app server
gem 'puma', '~> 3.10.0'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.7'

gem 'sass-rails', '~> 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.2.0'
gem 'coffee-rails', '~> 4.2.2'
gem 'turbolinks', '~> 5.0.1'
gem 'certified', '~> 1.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3.1'
gem 'contentful', '~> 1.2.2'
gem 'contentful_model',
  git: 'https://github.com/contentful/contentful_model.git',
  ref: '771c484'
gem 'contentful-management', '~> 1.8.1'
gem 'redcarpet', '~> 3.4.0'
gem 'rails_12factor', '~> 0.0.3'
gem 'sidekiq', '~> 5.0.4'
gem 'algoliasearch', '~> 1.12.6'
#gem 'dalli', '~> 2.7.6'

# profiling page load times
# gem 'rack-mini-profiler', '~> 0.10.5', require: false
# gem 'stackprof', '~> 0.2.10', require: false
# gem 'flamegraph', '~> 0.9.5', require: false
# gem 'memory_profiler', '~> 0.9.8', require: false

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2017.2', platforms: [:mingw, :mswin, :x64_mingw, :jruby ,:ruby]

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'foreman', '0.84.0'
  gem 'better_errors', '1.1.0'
  gem 'binding_of_caller', '0.7.2'
  gem 'pry-rails', '0.3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'httplog'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'dotenv-rails', '2.2.0', require: 'dotenv/rails-now'
end

group :test do
  gem 'rspec'
  gem 'rspec-rails', '~> 3.6'
  gem "rspec_junit_formatter"
  gem 'guard-rspec', require: false
  gem "webmock", "~> 3.0"
  gem "sinatra", "~> 2.0"
  gem "capybara", "~> 2.15"
  gem "selenium-webdriver", "~> 3.5"
  gem 'timecop'
end
