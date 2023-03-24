require 'rails_helper'

RSpec.describe 'entities/new.html.erb', type: :system do
  user = User.create!(email: 'kamala@email.com', password: 'qwerty')
  Group.create!(name: 'Docker', icon: 'urlhttps/img', user:)
  Group.create!(name: 'DevOps', icon: 'urlhttps/img/img', user:)

  before do
    login_as(user, user: :scope)
  end

  it 'Creates new Transaction and redirects to transaction page' do
    visit new_user_entity_path(user_id: user.id)
    fill_in 'Name', with: 'Transaction 1'
    fill_in 'Amout', with: 20.50
    select 'DevOps', from: 'entity_group_id'
    click_on 'Add Transaction'
    visit user_entities_path(user_id: user.id)
    expect(page.current_path).to eq(user_entities_path(user_id: user.id))
  end
end
