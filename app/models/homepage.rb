class Homepage < ApplicationRecord
  belongs_to :user
  
  validates :tilte, presence: true
end
