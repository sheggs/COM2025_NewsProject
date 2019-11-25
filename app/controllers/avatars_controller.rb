class AvatarsController < ApplicationController
	def self.getAvatar(user_id)
		return Avatar.find_by(user_id: user_id)
	end
	def create
		  @currentUser = User.find_by(id: session[:user_id])
   		  @image_data = params[:avatar]
   		  @queryAvatars = Avatar.find_by(user_id: session[:user_id])
   		  if(@queryAvatars != nil)
   		  	@queryAvatars.destroy
   		  end

   		  Avatar.create({:avatar => @image_data, :user_id => @currentUser.id})
	end
end
