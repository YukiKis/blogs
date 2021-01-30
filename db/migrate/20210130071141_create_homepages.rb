class CreateHomepages < ActiveRecord::Migration[5.2]
  def change
    create_table :homepages do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :introduction

      t.timestamps
    end
  end
end
