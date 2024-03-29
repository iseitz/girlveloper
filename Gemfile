source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'
# Use postgresql for a database
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'font-awesome-sass', '~> 6.2.1'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'
#gem 'rmagick'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'haml-rails', '~> 2.0'
gem 'net-http'
gem 'html2haml'
gem 'simple_form' # creating forms made easier
gem 'devise'
gem 'friendly_id', '~> 5.2.4' # nice URLs and hide IDs
gem 'ransack' #search and sort
gem 'public_activity' # see all activity in the app
gem 'rolify' # give users roles (admin, teacher, student)
gem 'pundit' # authorization (different roles have different accesses)
gem 'pagy' # pagination
gem "chartkick" #charts
gem 'groupdate' #group records by day/week/year
gem 'recaptcha' #user validations to avoid bots in production
gem 'aws-sdk-s3', require: false #save images and files in amazon s3 service for development and production
gem 'active_storage_validations' #validate image and file uploads for active storage


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
  gem 'rubocop-rails', require: false
  gem 'bullet'
  gem 'brakeman'
  gem 'reek'
  gem 'rails_best_practices'
  gem 'solargraph'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'capybara-screenshot'
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 3.1'
  gem 'selenium-webdriver'
  gem 'email_spec'
  gem 'launchy'
  gem 'timecop'
  gem 'pdf-inspector', require: 'pdf/inspector'
end