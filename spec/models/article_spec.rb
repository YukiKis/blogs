require "rails_helper"

RSpec.describe Article, type: :model do
  context "on validation" do
    it "belongs_to homepage" do
      expect(Article.reflect_on_association(:homepage).macro).to eq :belongs_to
  end
end