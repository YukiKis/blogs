class Homepage < ApplicationRecord
  belongs_to :user
  has_many :articles
  
  validates :agreement, acceptance: { on: :create }
  validates :tilte, presence: true
end
