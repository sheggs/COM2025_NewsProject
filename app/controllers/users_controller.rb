class UsersController < ApplicationController
    def index
       @currentUser = current_user
    end


    def self.getAvatar(user_id)
      if(Avatar.find_by(user_id: user_id) != nil)
        return Avatar.find_by(user_id: user_id);
      end
      return "grey.jpg";
    end



    def self.getUserData(user_id)
      return User.find_by(id: user_id)
    end
    # The users' dashboard to change their name or password or image.
    def dashboard
      if(current_user != nil)
        @currentUser = current_user
        @avatar = Avatar.find_by(user_id: current_user.id)
      else
        redirect_to '/'
      end
    end

    def logout 
      session[:user_id] = nil;
      redirect_to '/login'
    end
   def dashboard
      if(current_user != nil)
        @currentUser = current_user
        @avatar = Avatar.find_by(user_id: current_user.id)
      else
        redirect_to '/'
      end
    end
    # def updateAvatar
    #   logger.debug "hi"
    #   image_data = params[:avatar]
    #  # logger.debug current_user.avatar.url
    # end

    # def makeAdmin
    #   @currentUser = User.find_by(id: session[:user_id])
    #   @currentUser.update_attributes({:admin => true})

    # end


    def simpleupdate
      @error = ""
      #Storing paramters in variables for easy access
      user_infohash = params[:user];
      name = user_infohash[:name];
      password = user_infohash[:password];
        if(current_user.valid_password?(password) and  checkValidity(name,"Name"))
          current_user.update_attributes({:name => name})
        end
      # if(  (password == @currentUser.password) and checkValidity(name,"Name")  )
      #   logger.debug "REACHED"
      #   @currentUser.update_attributes({:name => name, :password => password})
      # end
    end

    def edit

    #   logger.debug("______________")
    #         logger.debug parameter_update[:admin]

    #   logger.debug "______ start _________"

    # logger.debug checkboxBoolean(parameter_update[:admin])
  #  logger.debug "___________ ended __________"
   # logger.debug(parameter_update[:id])
      @selecteduser = UsersController.getUserData(parameter_update[:id])
      @selecteduser.name = parameter_update[:name]
      @selecteduser.email = parameter_update[:email]
      @selecteduser.admin = checkboxBoolean(parameter_update[:admin])


    respond_to do |format|
      logger.debug(checkboxBoolean(parameter_update[:delete]))
      if(checkboxBoolean(parameter_update[:delete]) == true)
        #Cannot delete the user that is logged in.
        if(@selecteduser.id == current_user.id)
          format.html {redirect_to selecteduser, notice: "Updated"}
          format.json {render :show, status: :created, location: selecteduser}
          format.js{
            @urgentMessage = "Cannot delete the current logged in object"
            @respond = "false"
          flash[:errors] =[]}
        else
          @selecteduser.delete
          @selecteduser.save
          format.js{
            @modal = "true"
          }

        end
      else
         if(checkValidity(parameter_update[:name],"name") and @selecteduser.save)
          format.html {redirect_to selecteduser, notice: "Updated"}
          format.json {render :show, status: :created, location: selecteduser}
          format.js{ @urgentMessage = ""
          @respond = "true"}
        else
          format.html{render :newpost }
          format.json {render json: @post.errors, status: :unprocessable_entity}
          format.js{
            flash[:errors] =[]
            flash[:errors].push({:t => "", :msg => @error})
              @selecteduser.errors.each do |t,msg|
                flash[:errors].push({:t => t, :msg => msg})
              end
            logger.debug flash[:errors]
            @urgentMessage = ""
            @respond = "false"}
        end
      end
       
    end

    end
        # def updateAvatar
    #   @currentUser = User.find_by(id: session[:user_id])
    #   avatarData = params[:avatar];
    #   @currentUser.update_attributes(:avatar => avatarData);

    # end

    # def login
    #   user_infohash = params[:user];
    #   @user = User.find_by(email: user_infohash[:email])
    #   if(@user == nil)
    #       flash[:error] = "No records found"
    #       redirect_to '/login';
    #   else
    #     if(@user.password == user_infohash[:password])
    #       session[:user_id] = @user.id;
    #       redirect_to '/dashboard';

    #     else
    #       flash[:error] = "Wrong password. Check if you have Caps Lock enabled."
    #       redirect_to '/login';
    #     end
    #   end
    # end


    # def create 
    # 	@error = "";
    # 	# Getting the parameters
    # 	user_infohash = params[:user];
    # 	#Storing paramters in variables for easy access
    # 	email = user_infohash[:email];
    # 	password = user_infohash[:password];
    # 	confirm_password = user_infohash[:password2];

    # 	# Checking if the user does not exist and if the passwords are equal and if all the fields have more than 5 characters;
    # 	if( !(userExists(email)) and checkEquality(password,confirm_password) and checkValidity(email,"Email") and checkValidity(password,"Password") and checkValidity(confirm_password, "Confirm Password")  )
    # 		#Creating the user

    # 		 @user = User.new({:email => user_infohash[:email], :password => user_infohash[:email], :admin => false});
    # 		 # If the user is successfully created
    # 		 if(@user.save)
    # 		 	logger.debug "User created"
    # 		 	session[:user_id] = @user.id;
    # 		 	#Add session here
    # 		 else
    # 		 	#Flash Error
    # 		 end
    # 	else
    # 		#Flash Error Email exists or password fields are not the same or less than 5 characters
    # 		flash[:error] = @error
    # 		redirect_to '/login'

    # 	end

    # end



   private def parameter_update
    params.require(:user).permit(:id,:name,:email,:delete,:admin)

   end

   private def checkValidity(entry,type)
    @error = ""
   	if(entry.mb_chars.length > 5)
   		return true;
   	else
   		@error = @error + type + " Field must be greating than 5 characters"
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
  private def checkboxBoolean(value)
      if (value == "1" or value == "on")
        return true;
      end
      return false;
      
    end

end

