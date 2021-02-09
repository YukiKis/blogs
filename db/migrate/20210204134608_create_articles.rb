class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :homepage, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.string :tag

      t.timestamps
    end
  end
end
