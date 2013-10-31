== Lesson 1



== Lesson 2

rails g controller sessions new

- Add admin log-in link


== Lesson 3

=== Log in for voters

- We need to change our old log in method so we can support both admins and voters logging in with the same page

	Add this to the login view.

	<pre>
	  <p>
	  	<%= label_tag :is_admin %><br />
	  	<%= check_box_tag :is_admin %>
	  </p>
	</pre>

  	Change the authentication method in the session controller

 	<pre>
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
	</pre>
