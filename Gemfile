source 'https://rubygems.org'

ruby '2.5.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-datatables-rails', '~> 3.4.0'
gem 'jquery-ui-rails'
gem 'rails_sortable'

# gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '>= 3.4.1'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'bootstrap-datepicker-rails'
gem 'fullcalendar-rails'
gem 'momentjs-rails'

gem "devise", ">= 4.6.0"
gem 'friendly_id', '~> 5.2.0'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'acts_as_commentable_with_threading'
gem "cocoon"
gem 'carrierwave'
gem 'cloudinary'
gem 'mini_magick'
gem 'meta-tags'
gem 'trix'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '~> 2.13'
  # gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
