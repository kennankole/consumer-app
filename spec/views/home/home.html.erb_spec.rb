require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :feature do
  scenario 'When a user visits the home page' do
    visit "/"
    expect(page).to have_content("Snapscan")
    expect(page).to have_link('Log in')
    expect(page).to have_link('Sign Up')
  end
end
