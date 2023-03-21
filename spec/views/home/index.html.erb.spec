require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :feature do
  user = User.create!(email: 'users30@email.com', password: 'qwerty')
  before do
    login_as(user, scope: :user)
  end

  scenario 'When a user visits the home page' do
    visit "/"
    expect(page).to have_content("Snapscan")
    expect(page).to have_button('Log out')
  end
end