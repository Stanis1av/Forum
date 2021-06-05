require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should have_many(:comments).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:id_author) }
end
