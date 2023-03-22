require 'rails_helper'

RSpec.describe "entities/index.html.erb", type: :system do
  user = User.create!(email: 'daniel@email.com', password: 'passcode')
  before do
    login_as(user, scope: :user)
  end

  it 'Transaction page ' do
    visit user_entities_path(user_id: user.id)
    expect(page).to have_link('Add a New Transaction')
    click_on 'Add a New Transaction'
    visit new_user_entity_path(user_id: user.id)
    expect(page.current_path).to eq(new_user_entity_path(user_id: user.id))
  end
end
