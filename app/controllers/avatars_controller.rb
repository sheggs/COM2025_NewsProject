class AvatarsController < ApplicationController
	def self.getAvatar(user_id)
		if(Avatar.find_by(user_id: user_id) != nil)
			return Avatar.find_by(user_id: user_id).avatar.url;
		end
		return "grey.jpg";
	end
	def create
		  @currentUser = current_user
   		  @image_data = params[:avatar]
   		  @queryAvatars = Avatar.find_by(user_id: session[:user_id])
   		  if(@queryAvatars != nil)
   		  	@queryAvatars.destroy
   		  end

   		  Avatar.create({:avatar => @image_data, :user_id => @currentUser.id})
	end
end
