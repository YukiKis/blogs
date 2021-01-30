class User < ApplicationRecord
  has_secure_password
  
  validates :agreement, acceptance: true
  validates :name, length: { in: 2..30 }
  
  def current_user?(session)
    self == User.find(session)
  end
end
