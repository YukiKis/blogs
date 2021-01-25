require "rails_helper"

RSpec.describe "HomesController", type: :system do
  context "on root page" do
    before do
      visit root_path
    end
    it "is right URL" do
      expect(current_path).to eq root_path
    end
  end
  context "on about page" do
    before do
      visit about_path
    end
    it "is right URL" do
      expect(current_path).to eq about_path
    end
  end
end