class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  include PostsHelper

  def self.getPost(post_id)
    return Post.find_by(id: post_id)
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @breakingPosts = getBreakingPosts;
    @isEmpty = (@breakingPosts.count <= 0);
    @normalPosts = getNormalPosts;
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    # @post = Post.new(post_params)
    @post = Post.new({:title => post_params[:title],:summary => post_params[:summary], :body => post_params[:text], :user_id => post_params[:user_id], :banner => post_params[:banner], :comment_enabled => checkboxBoolean(post_params[:comment]), :important => checkboxBoolean(post_params[:important])})

    respond_to do |format|
      if @post.save
        ContactMailer.notify_new_post(@post)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    logger.debug "hi"

    respond_to do |format|
      if(checkboxBoolean(post_params[:delete]) == true)
        logger.debug "sup"
        @post.delete
        @post.save
          format.js{
            @modal = "true"
          }
      else
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
          format.js{ @urgentMessage = ""
            @respond = "true"}
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :user_id, :title, :important, :summary, :comment_enabled,:banner,:delete,:id)
    end

      def checkboxBoolean(value)
      if (value == "1" or value == "on")
        return true;
      end
      return false;
      
    end
end
