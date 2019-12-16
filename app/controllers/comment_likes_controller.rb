class CommentLikesController < ApplicationController

	def self.alreadyLiked(user,comment)
		if(CommentLike.find_by(user_id: user, comment_id: comment) != nil)
			return true;
		else
			return false;
		end
	end

	def self.getModel(user,comment)
		CommentLike.find_by(user_id: user, comment_id: comment)
	end

	def self.setLog(user,comment)
		@log = CommentLike.new(user: user, comment: comment);
		@log.save
	end
end
