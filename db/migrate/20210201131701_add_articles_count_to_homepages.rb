class AddArticlesCountToHomepages < ActiveRecord::Migration[5.2]
  def change
    add_column :homepages, :articles_count, :integer, default: 0
  end
end
