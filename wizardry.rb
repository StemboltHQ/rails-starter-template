environment <<-RUBY
# Disable generation of helpers, javascripts, css, and view specs
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
    end
RUBY

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
