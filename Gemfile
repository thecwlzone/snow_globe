source "https://rubygems.org"
ruby "2.4.1"
gem "rails", "~> 5.1.4"

gem "awesome_print"
gem "authy"
gem "babel-transpiler"
gem "bootstrap-sass"
gem "city-state"
gem "coffee-rails"
gem "delayed_job_active_record"
gem "devise"
gem "dotenv-rails"
gem "jbuilder"
gem "jquery-rails"
gem "money-rails"
gem "paper_trail"
gem "paypal-sdk-rest"
gem "pg"
gem "puma"
gem "pundit"
gem "rollbar"
gem "sass-rails"
gem "simple_form"
# gem "slim-rails", github: "slim-template/slim-rails"
# gem "sprockets", github: "rails/sprockets"
gem "stripe"
gem "tax_cloud"
gem "turbolinks"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "uglifier"
gem "whenever", require: false

# START: active_admin
gem "activeadmin"
gem "active_admin_theme"
gem "draper"
gem "inherited_resources"
gem "ransack"
# gem "activeadmin", github: "activeadmin/activeadmin"
# gem "active_admin_theme"
# gem "inherited_resources", github: "activeadmin/inherited_resources"
# gem "ransack", github: "activerecord-hackery/ransack"
# gem "draper", "> 3.x"
# gem "sass-rails", github: "rails/sass-rails"
# END: active_admin

group :development do
  gem "foreman"
  gem "listen"
  gem "rails_layout"
  # gem "slim_lint"
  # gem "spring-commands-rspec"
  # gem "spring-watcher-listen"
  # gem "spring"
  gem "web-console"
end

group :development, :test do
  gem "byebug", platform: :mri
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails"
  gem "rubocop"
end

group :test do
  gem "capybara-screenshot"
  gem "capybara"
  gem "database_cleaner"
  gem "fake_stripe"
  gem "launchy"
  gem "poltergeist"
  gem "selenium-webdriver"
  # gem "sinatra", github: "sinatra/sinatra"
  gem "vcr"
  gem "webmock"
end

# START: mail_gems
group :development, :staging do
  gem "mail_interceptor"
  gem "email_prefixer"
end
# END: mail_gems
