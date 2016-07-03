# Nothing to see here yet.

gem_group :development, :test do
  gem "rspec-rails", "~> 3.5.0"
  gem "factory_girl_rails", "~> 4.7"
end

after_bundle do
  rails_command "db:create"
  rails_command "db:migrate"

  generate "rspec:install"

  generate "controller", "home", "index"
end
