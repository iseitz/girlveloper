source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.7.8'
# Use postgresql for a database
gem 'pg', '1.4.5'
# Use Puma as the app server
gem 'puma', '5.6.5'
# Use SCSS for stylesheets
gem 'sass-rails', '6.0.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '5.4.3'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.11.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'font-awesome-sass', '6.2.1'

# Use Active Storage variant
gem 'image_processing', '1.12.2'
#gem 'rmagick'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.15.0', require: false

gem 'haml-rails', '2.1.0'
gem 'net-http', '0.3.2'
gem 'html2haml', '2.3.0'
gem 'simple_form', '5.2.0' # creating forms made easier
gem 'devise', '4.8.1'
gem 'friendly_id', '5.2.5' # nice URLs and hide IDs
gem 'ransack', '4.0.0' #search and sort
gem 'public_activity', '2.0.2' # see all activity in the app
gem 'rolify', '6.0.1' # give users roles (admin, teacher, student)
gem 'pundit', '2.3.0' # authorization (different roles have different accesses)
gem 'pagy', '6.0.3' # pagination
gem 'chartkick', '5.0.4' #charts
gem 'groupdate', '6.2.1' #group records by day/week/year
gem 'recaptcha', '5.15.0' #user validations to avoid bots in production
gem 'aws-sdk-s3', '1.136.0', require: false #save images and files in amazon s3 service for development and production
gem 'active_storage_validations', '1.0.4' #validate image and file uploads for active storage


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug','11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '4.1.2'
  gem 'pry-rails', '0.3.9'
  gem 'pry-doc', '1.4.0'
  gem 'pry-byebug', '3.10.1'
  gem 'factory_bot_rails', '4.11.1'
  gem 'faker', '3.1.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '4.2.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '2.3.4'
  gem 'listen', '3.8.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '4.1.1'
  gem 'rubocop', '1.44.0', require: false
  gem 'rubocop-performance', '1.15.2'
  gem 'rubocop-rspec', '2.18.1'
  gem 'rubocop-rails', '2.17.4', require: false
  gem 'bullet', '7.0.7'
  gem 'brakeman', '5.4.0'
  gem 'reek', '6.1.4'
  gem 'rails_best_practices', '1.23.2'
  gem 'solargraph', '0.48.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem 'cucumber-rails', '2.6.1', require: false
  gem 'database_cleaner', '2.0.1'
  gem 'capybara-screenshot', '1.0.26'
  gem 'simplecov', '0.22.0', require: false
  gem 'shoulda-matchers', '3.1.3'
  gem 'selenium-webdriver', '4.8.0'
  gem 'email_spec', '2.2.1'
  gem 'launchy', '2.5.2'
  gem 'timecop', '0.9.6'
  gem 'pdf-inspector', '1.3.0', require: 'pdf/inspector'
end