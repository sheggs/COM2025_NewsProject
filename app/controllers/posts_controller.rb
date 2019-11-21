class PostsController < ApplicationController

	def index
	end
	def newpost
	end
	def create
		parameters = params[:post]
		logger.debug parameters;
		@post = Post.new({:title => parameters[:title],:summary => parameters[:description],:body => parameters[:text], :user_id => session[:user_id], :banner => parameters[:banner], :comment_enabled => true, :important => true})
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
		def cleanErrors(message)
			array = []
		end

end
