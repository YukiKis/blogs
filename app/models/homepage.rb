class Homepage < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  
  validates :agreement, acceptance: { on: :create }
  validates :title, length: { in: 2..50 }
end
