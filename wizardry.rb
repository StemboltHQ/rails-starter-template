def install_template(path)
  template_path = File.expand_path(File.join('..', path), __FILE__)
  template = File.read(template_path)
  file path, template, force: true
end

def commit_all(message)
  git add: "."
  git commit: "-m '#{message}'"
end

git :init

# Disable generation of helpers, javascripts, css, and view specs.
environment <<-RUBY
config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
    end
RUBY

gem_group :development, :test do
  gem "rspec-rails", "~> 3.5.0"
  gem "factory_girl_rails", "~> 4.7"
  gem "capybara", "~> 2.7"
  gem "poltergeist", "~> 1.10"
end

after_bundle do
  rails_command "db:create"
  rails_command "db:migrate"
  commit_all "Initial commit"

  generate "rspec:install"
  install_template "spec/spec_helper.rb"
  install_template "spec/rails_helper.rb"

  commit_all "Setup testing environment"

  generate "controller", "home", "index"
  install_template "config/routes.rb"

  commit_all "Add home controller"
end
