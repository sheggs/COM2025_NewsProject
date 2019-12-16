class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # GET /comments
  # GET /comments.json

  def self.getComments(post_id)
    return Comment.find_by(post_id: post_id)
  end
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  def likepost
    @comment = Comment.find_by(id: like_param)

    message = "liked"
    if(CommentLikesController.alreadyLiked(current_user.id, @comment.id))
      commentLikes = CommentLikesController.getModel(current_user,@comment);
      commentLikes.destroy
      @comment.likes = @comment.likes - 1
     message = "unliked"

    else

      @comment.likes = @comment.likes + 1

      CommentLikesController.setLog(current_user,@comment);


    end
    respond_to do |format|
      if @comment.save
          format.html { @selectedPost = PostsController.getPost(@comment.post_id)
          redirect_to '/posts/' + @comment.post_id.to_s, notice: 'Comment was successfully ' + message + '.' }
          format.json { render :show, status: :created, location: @comment }
      end
    end
  end
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to '/posts/' + comment_params[:post_id], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :post_id,:user_id)
    end
       def destory_param
       params.require(:id)
    end

    def like_param
      params.require(:id)
    end
end
