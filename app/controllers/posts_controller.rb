require "time"
class PostsController < ApplicationController

	def index
		@breakingPosts = Post.where(important: true);
		@isEmpty = (@breakingPosts.count <= 0);
		# @breakingPosts.count get the total returns
	end
	def newpost
	end
	def create
		parameters = params[:post]
		logger.debug parameters;
		@post = Post.new({:title => parameters[:title],:summary => parameters[:description],:body => parameters[:text], :user_id => session[:user_id], :banner => parameters[:banner], :comment_enabled => checkboxBoolean(parameters[:comment]), :important => checkboxBoolean(parameters[:important])})

		@post.save
		if @post.errors.any?
			flash[:errors] =[]
			@post.errors.each do |t,msg|
				flash[:errors].push({:t => t, :msg => msg})
			end
		end

		redirect_to '/admin'
	end


	private 

		def checkboxBoolean(value)
			if value == "on"
				return true;
			end
			return false;
			
		end

end
