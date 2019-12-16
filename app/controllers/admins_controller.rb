class AdminsController < ApplicationController
  def index
  end

  def user_management
  	@allUserData = User.all;
  end

  def post_management
    @allPosts = Post.all;

  end

  def user_edit	
  end

  
  def post_edit 
  end
end
