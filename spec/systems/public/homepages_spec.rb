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
    it "has title" do
      expect(page).to have_content homepage1.tilte
    end
    it "has content of the latest article" do
      expect(page).to have_content homepage1.articles.first
    end
    it "has link to new article" do
      expect(page).to have_link "記事を追加する", href: new_homepage_article_path(homepage1)
    end
  end
  
  context "on new" do
    before do
      visit new_user_homepage_path(user1)
    end
    it "is the right URL" do
      expect(current_path).to eq new_user_homepage_path(user1)
    end
    it "has homepage form" do
      expect(page).to have_field "homepage[title]"
      expect(page).to have_field "homepage[introduction]"
      expect(page).to have_field "homepage[agreement]"
      expect(page).to have_button "作成"
    end
    it "succeeds to make a new blog" do
      fill_in "homepage[title]", with: "例"
      check "homepage[agreement]"
      click_button "作成"
      expect(page).to have_content "ホームページが作成できました"
    end
    it "fails to make a blog" do
      click_button "作成"
      expect(page).to have_content "エラー"
    end
  end
end