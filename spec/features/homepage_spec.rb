require 'feature_helper'

RSpec.feature 'Home Page' do
  scenario 'logged in use visits', js: true do
    visit '/'
    expect(page).to have_content 'Home#index'
  end
end
