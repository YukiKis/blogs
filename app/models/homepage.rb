class Homepage < ApplicationRecord
  belongs_to :user
  has_many :articles
  
  validates :tilte, presence: true
end
