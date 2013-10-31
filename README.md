== Lesson 1



== Lesson 2

rails g controller sessions new

- Add admin log-in link


== Lesson 3

=== Log in for voters

- We need to change our old log in method so we can support both admins and voters logging in with the same page

	Add this to the login view.

	```html
	  <p>
	  	<%= label_tag :is_admin %><br />
	  	<%= check_box_tag :is_admin %>
	  </p>
	```

  	Change the authentication method in the session controller

 	```ruby
		def create
			if params[:is_admin] == "1" 
			  admin = Admin.authenticate(params[:username], params[:password])
			  if admin
			    session[:user] = admin
			    redirect_to root_url, :notice => "Welcome #{admin.username}"
			  else        
			    redirect_to new_session_path, :notice => "Invalid username or password"
			  end       
			else
			  # its a regular voter
			  voter = Voter.authenticate(params[:username], params[:password])
			  if voter
			    session[:user] = voter
			    redirect_to root_url, :notice => "Welcome #{voter.username}"
			  else
			    redirect_to new_session_path, :notice => "Invalid username or password"
			  end
			end     
		end
	```

	Add the ability for a vote to be authenticated

	```ruby
		def self.authenticate(username, password)
	    	voter = find_by_username_and_password_and_approved(username, password, true)    
	  	end
  	```

  	Now voters can log in, but how do differentiate between the admin and a normal voter?

  	Modify our existing helpers...

  	```ruby
		def admin_is_logged_in?
			session[:user] != nil && session[:user].is_a?(Admin)
		end

		def voter_is_logged_in?
			session[:user] != nil && session[:user].is_a?(Voter)
		end

		def user_is_logged_in?
			# This could be either a voter or admin
			voter_is_logged_in? || admin_is_logged_in?
		end
  	```

  	We can now use this helpers to differentiate between when a voter is logged in, an admin is logged in or nobody is logged in.

