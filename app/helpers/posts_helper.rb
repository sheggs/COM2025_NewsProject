module PostsHelper
	def getBreakingPosts
		return Post.where(important: true);
	end

	def getNormalPosts
		return Post.where(important: false);
	end


end
