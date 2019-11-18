require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should allow_value("abc@example.com").for(:email) }
    it { should_not allow_value("abc").for(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
