class Admin < ActiveRecord::Base
  #attr_accessible :email, :password, :username
  
  def self.authenticate(username, password)
    user = find_by_username_and_password(username, password)    
  end
end
