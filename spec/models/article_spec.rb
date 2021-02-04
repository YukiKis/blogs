require "rails_helper"

RSpec.describe Article, type: :model do
  content "on validation" do
    let(:user1){ create(:user1) }
    let(:homepage){ create(:homepage1, user: user1) }
    let(:article1){ create(:article1, homepage: homepage1) }
    it "belongs_to homepage" do
      expect(Article.reflect_on_association(:homepage).macro).to eq :belongs_to
    end
    it "is valid" do
      expect(article1).to be_valid
    end
    it "is invalid without title" do
      article1.title = ""
      expect(article1).to be_invalid
    end
    it "is invalid without content" do
      article1.content = ""
      expect(article1).to be_invalid
    end
  end
end