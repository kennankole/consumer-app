require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:icon) }
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:entities) }
end
