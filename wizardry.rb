def install_template(path, source_path: nil)
  source_path ||= path
  template_path = File.expand_path(File.join('..', source_path), __FILE__)
  template = File.read(template_path)
  file path, template, force: true
end

def commit(message)
  yield
  git add: "."
  git commit: "-m '#{message}'"
end

git :init

gem_group :development, :test do
  gem "rspec-rails", "~> 3.5.0"
  gem "factory_girl_rails", "~> 4.7"
  gem "capybara", "~> 2.7", require: false
  gem "poltergeist", "~> 1.10", require: false
end

after_bundle do
  commit "Initial commit" do
    environment <<-RUBY
  config.generators do |generate|
        generate.helper false
        generate.assets false
        generate.view_specs false
      end
RUBY

    install_template ".gitignore", source_path: "gitignore"
    install_template "app/views/layouts/application.html.erb"

    rails_command "db:create"
    rails_command "db:migrate"
  end

  commit "Setup testing environment" do
    generate "rspec:install"
    install_template "spec/spec_helper.rb"
    install_template "spec/rails_helper.rb"
    install_template "spec/feature_helper.rb"
    install_template "spec/features/homepage_spec.rb"
  end

  commit "Add home controller" do
    generate "controller", "home", "index"
    install_template "config/routes.rb"
  end
end
