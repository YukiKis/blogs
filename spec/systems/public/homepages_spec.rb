require "rails_helper"

RSpec.describe "HomepagesController", type: :system do
  let(:user1){ create(:user1) }
  let(:user2){ create(:user2) }
  let(:homepage1){ create(:homepage1, user: user1) }
  let(:homepage2){ create(:homepage2, user: user2) }
  
  before do
    login_user(user1)
  end
  
  context "on index" do
  end
  
  context "on list" do
    before do 
      visit list_homepages_path
    end
    it "is the right URL" do
      expect(current_path).to eq :list_homepages_path
    end
    it "has homepages list" do
      Homepage.all.each do |homepage|
        expect(page).to have_content homepage.title
        expect(page).to have_link "VIEW", homepage_path(homepage)
      end
    end
  end
  
  context "on show" do
    before do
      visit homepage_path(homepage1)
    end
    it "is the right URL" do
      expect(current_path).to eq homepage_path(homepage1)
    end
  end
end