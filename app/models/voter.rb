class Voter < ActiveRecord::Base
  #attr_accessible :approved, :email, :password, :phone, :username

  validates :email, presence: true
  validates :email, email: true
  validates :username, presence: true
end
