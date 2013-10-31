class Voter < ActiveRecord::Base
  #attr_accessible :approved, :email, :password, :phone, :username

  validates :email, presence: true
  validates :email, email: true
  validates :username, presence: true

  def self.authenticate(username, password)
  	# only authorized voters can log in
    voter = find_by_username_and_password_and_approved(username, password, true)    
  end
end
