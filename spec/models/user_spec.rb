require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }
  context "basics" do
    it "has a valid factory" do
      expect(subject).to be_valid
    end
    it "requires password to be at least 10 chars long" do
      pw = Faker::Internet.password(max_length: 9)
      u = build(:user, password: pw)
      expect(u).to_not be_valid
    end
  end
end
