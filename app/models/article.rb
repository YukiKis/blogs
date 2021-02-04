class Article < ApplicationRecord
  belongs_to :homepage
  
  validates :article, length: { in: 5..100 }
  validates :content, presence: true
end
