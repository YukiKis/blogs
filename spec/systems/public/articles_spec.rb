require "rails_helper" 

RSpec.describe "ArticleHomepage", type: :system do
  let(:user1){ create(:user1) }
  let(:homepage1){ create(:homepage1, user: user1) }
  let(:article1){ create(:article1) }
  before do
    login_user(user1)
  end
  context "on index" do
    
  end
  
  cottext "on show" do
  end
  
  context "on new" do
    before do
      visit new_homepage_article_path(homepage1)
    end
    it "has title form" do
      expect(page).to have_field "article[title]"
    end
    it "has content form" do
      expect(page).to have_field "article[content]"
    end
    it "has tag form" do
      expect(page).to have_field "article[tag]"
    end
    it "has button to submit" do
      expect(page).to have_button "作成"
    end
    it "succeeds to make a new article" do
      fill_in "article[title]", with: "example"
      fill_in "article[content]", with: "exampleexample"
      fill_in "article[tag]", with: "example, eg"
      click_button "作成"
      expect(page).to have_content "新しい記事を作成しました"
    end
    it "fails to make it" do
      click_button "作成"
      expect(page).to have_content "エラー"
    end
  end
  
  context "on edit" do
    before do
      visit edit_article_path(article1)
    end
    it "has title field" do
      expect(page).to have_field "article[title]", with: article1.title
    end
    it "has content field" do
      expect(page).to have_field "article[content]", with: article1.content
    end
    it "has tag field" do
      expect(page).to have_field "article[tag]", with: article1.tag
    end
    it "has button to submit" do
      expect(page).to have_button "更新"
    end
    it "has link to delete" do
      expect(page).to have_link "削除", href: article_path(article1)
    end
    it "succeeds to update" do
      fill_in "article[title]", with: "例れいれいれいれい例"
      fill_in "article[content]", with: "例例例例れい"
      fill_in "article[tag]", with: "例, eg"
      click_button "更新"
      expect(page).to have_content "更新出来ました"
    end
    it "fails to update" do
      fill_in "article[title]", with: ""
      click_button "更新"
      expect(page).to have_content "エラー"
    end
  end
end