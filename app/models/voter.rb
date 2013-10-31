class Voter < ActiveRecord::Base
  #attr_accessible :approved, :email, :password, :phone, :username

  validates :email, presence: true
  validates :email, email: true
  validates :username, presence: true

  def self.authenticate(username, password)
    voter = find_by_username_and_password(username, password)    
  end
end
