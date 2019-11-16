class UsersController < ApplicationController
    def index
    	puts "Index"
    end
    def create 
    	logger.debug "Test"
    	userExists("asd")
    	# puts "Hii"
    	# user_infohash = params[:user];

    	# @user = User.new({:email => user_infohash[:email], :password => user_infohash[:email], :admin => false});
    	# if(@user.save)
    	# 	puts "User created successfully: ";
    	# end
    end



   private def parameter
   end

   private def userExists(email_data)
   	found = User.where(email: email_data)
   	if(found != nil)
   		puts "Account found"
   	else
   		puts "NOT EXISTS"
   	end
   end
    
end
