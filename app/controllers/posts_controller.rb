class PostsController < ApplicationController

	def index
	end
	def newpost

	end
	def create
		parameters = params[:post]
		Post.new({:title => parameter[:title],})
	end
end
