require 'rails_helper'

RSpec.describe "categories/create.html.erb", type: :system do
  user = User.create!(email: 'timm@me.com', password: 'passcode')
  before do
    login_as(user, scope: :user)
  end

  it 'It creates a new category' do
    visit new_user_category_path(user)
    fill_in 'Name', with: 'School feees'
    fill_in 'Icon', with: 'https://img.freepik.com/free-photo/neon-tropical-monstera-leaf-banner_53876-138943.jpg?w=2000'
    click_on 'Save'
    visit user_categories_path(user_id: user.id)
    expect(page.current_path).to eq(user_categories_path(user_id: user.id))
  end
end