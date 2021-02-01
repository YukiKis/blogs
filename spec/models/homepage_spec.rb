require "rails_helper"

RSpec.describe Homepage, type: :model do
  let(:user){ create(:user1) }
  let(:homepage){ create(:homepage, user: user) }
  context "on validation" do
    it "belongs_to user" do
      expect(Homepage.reflect_on_association(:user).macro).to eq :belongs_to
    end
    it "has many articles" do
      expect(Homepage.reflect_on_association(:articles).macro).to eq :has_many
    end
    it "is valid" do
      expect(homepage).to be_valid
    end
    it "is invalid without title" do
      homepage.title = ""
      expect(homepage).to be_invalid
    end
  end
end