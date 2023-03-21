require 'rails_helper'

RSpec.describe "entities/new.html.erb", type: :feature do
  user = User.create!(email: 'entity10@email.com', password: 'qwerty')
  group1 = Group.create!(name: 'Docker', icon: 'urlhttps/img', user: user)
  group2 = Group.create(name: 'DevOps', icon: 'urlhttps/img/img', user: user)

  before do
    login_as(user, user: :scope)
    visit new_user_entity_path(user_id: user.id)
  end

  it 'Creates new Transaction' do
    expect(page).to have_content('Add New Transaction')
    fill_in 'Name', with: 'Transaction 1'
    fill_in 'Amout', with: 20.50
    select 'DevOps', from: 'entity_group_id'
    click_on 'Add Transaction'
    visit user_entities_path(user_id: user.id)
    expect(page).to have_content('Find me in app/views/entities/index.html.erb')
  end
end
