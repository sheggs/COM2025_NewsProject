class PostsController < ApplicationController
	include PostsHelper

	def self.getPost(post_id)
 		return Post.find_by(id: post_id)
    end
	def index
		@breakingPosts = getBreakingPosts;
		@isEmpty = (@breakingPosts.count <= 0);
		@normalPosts = getNormalPosts;
		# @breakingPosts.count get the total returns
	end
	def newpost
	end
	def view
		logger.debug params[:id];
		@selectedPost = Post.find_by(id: params[:id])
		
	end
    # GET /posts/1
    # GET /posts/1.json
    def show
    	@post = Post.find_by(id: 2)
    end
	def new
  		@post = Post.new(params[:post])
	end
	def create
		parameters = params[:post]
		logger.debug parameters;
		@post = Post.new({:title => parameters[:title],:summary => parameters[:description],:body => parameters[:text], :user_id => current_user.id, :banner => parameters[:banner], :comment_enabled => checkboxBoolean(parameters[:comment]), :important => checkboxBoolean(parameters[:important])})

		# @post.save
		# if @post.errors.any?
		# 	flash[:errors] =[]
		# 	@post.errors.each do |t,msg|
		# 		flash[:errors].push({:t => t, :msg => msg})
		# 	end
		# end

		respond_to do |format|
			if(@post.save)
				format.html { flash[:success] = "Post created successfully"
					@breakingPosts = getBreakingPosts
					render :index }
				format.json {render :show, status: :created, location: @post}
			else
				format.html{
					if @post.errors.any?
						flash[:errors] =[]
						@post.errors.each do |t,msg|
							flash[:errors].push({:t => t, :msg => msg})
						end
					end
					render :newpost }
				format.json {render json: @post.errors, status: :unprocessable_entity}

			end
		end
		#redirect_to '/admin'
	end


	private 

		def checkboxBoolean(value)
			if value == "on"
				return true;
			end
			return false;
			
		end

end
