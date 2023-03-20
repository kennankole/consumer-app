require 'rails_helper'

RSpec.describe Entity, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amout) }
  it { should validate_numericality_of(:amout).is_greater_than_or_equal_to(0) }
  it { should belong_to(:user) }
end
