require "rails_helper"

RSpec.describe "HomesController", type: :system do
  context "on root page" do
    before do
      visit root_path
    end
    it "is right URL" do
      expect(current_path).to eq root_path
    end
    it "has link to Home" do
      expect(page).to have_link "Home", href: root_path
    end
    it "has link to About" do
      expect(page).to have_link "About", href: about_path
    end
    it "has link to log in" do
      expect(page).to have_link "Log in", href: login_path
    end
    it "has link to Register" do
      expect(page).to have_link "Register", href: register_path
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