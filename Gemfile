source "https://rubygems.org"

ruby "4.0.5"

gem "rails", "8.1.3"
gem "rake", "~> 13.4"

group :test do
  # The production evaluator uses PostgreSQL. SQLite is limited to the
  # repository-local compatibility harness under evaluation/compatibility_app.
  gem "pg", "~> 1.6"
  gem "sqlite3", "~> 2.9"

  gem "capybara", "~> 3.40"
  gem "database_cleaner", "~> 2.1"
  gem "factory_bot_rails", "~> 6.5"
  gem "faker", "~> 3.8"
  gem "rails-controller-testing", "~> 1.0"
  gem "rspec", "~> 3.13"
  gem "rspec-rails", "~> 8.0"
  gem "shoulda-matchers", "~> 8.0"
end
