require 'rails_helper'

RSpec.describe "categories/create.html.erb", type: :feature do
  user = User.create!(email: 'testiiyou@me.com', password: 'passcode')
  before do
    login_as(user, scope: :user)
    visit new_user_category_path(user)
  end

  it 'It creates a new category' do
    expect(page).to have_content('Add New Category')
    fill_in 'Name', with: 'School feees'
    fill_in 'Icon', with: 'url/https:img'
    click_on 'Add Category'
    visit user_categories_path(user_id: user.id)
    expect(page).to have_content('Find me in app/views/categories/index.html.erb')
  end
end