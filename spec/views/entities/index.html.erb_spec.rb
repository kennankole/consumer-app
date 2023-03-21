require 'rails_helper'

RSpec.describe "entities/index.html.erb", type: :feature do
  user = User.create!(email: 'index8@email.com', password: 'passcode')
  before do
    login_as(user, scope: :user)
    visit user_entities_path(user_id: user.id)
  end

  it 'Transaction page ' do
    expect(page).to have_content("Total #{Entity.sum(:amout)}")
    expect(page).to have_link('Add a New Transaction')
    click_on 'Add a New Transaction'
    expect(page.current_path).to eq(new_user_entity_path(user_id: user.id))
  end
end
