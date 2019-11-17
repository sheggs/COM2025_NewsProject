class UsersController < ApplicationController
    def index
       @currentUser = User.find_by(id: session[:user_id])

    end

    # The users' dashboard to change their name or password or image.
    def dashboard
      @currentUser = User.find_by(id: session[:user_id])
    end


    def create 
    	@error = "";
    	# Getting the parameters
    	user_infohash = params[:user];
    	#Storing paramters in variables for easy access
    	email = user_infohash[:email];
    	password = user_infohash[:password];
    	confirm_password = user_infohash[:password2]

    	# Checking if the user does not exist and if the passwords are equal and if all the fields have more than 5 characters;
    	if( !(userExists(email)) and checkEquality(password,confirm_password) and checkValidity(email,"Email") and checkValidity(password,"Password") and checkValidity(confirm_password, "Confirm Password")  )
    		#Creating the user

    		 @user = User.new({:email => user_infohash[:email], :password => user_infohash[:email], :admin => false});
    		 # If the user is successfully created
    		 if(@user.save)
    		 	logger.debug "User created"
    		 	session[:user_id] = @user.id;
    		 	#Add session here
    		 else
    		 	#Flash Error
    		 end
    	else
    		#Flash Error Email exists or password fields are not the same or less than 5 characters
    		flash[:error] = @error
    		redirect_to '/login'

    	end

    end



   private def parameter
   end

   private def checkValidity(entry,type)
   	if(entry.mb_chars.length > 5)
   		return true;
   	else
   		@error = @error + type + "Field must be greating than 5 characters"
   	end
   	return false;
   end



   private def checkEquality(password, password2)
   	if(password2 == password)
   		return true;
   	else
   		@error = @error + " Password fields are not the same \n"
   	end
   	return false;
   end



   private def userExists(email_data)
   	t = User.find_by(email: email_data) 
   	if(User.find_by(email: email_data) == nil)
   		return false
   	else
   		@error = @error + " Email is already in use\n"
   	end
   	return true;
   end
    
end
