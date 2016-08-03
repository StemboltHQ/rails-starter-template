require 'rails_helper'

require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    window_size: [1920, 1080]
  )
end
Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 3

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:each, js: true) do
    page.driver.browser.url_whitelist = []
  end
end
