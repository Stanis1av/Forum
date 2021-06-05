require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should have_many(:comments).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:user_id) }
end
