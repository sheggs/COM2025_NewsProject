require 'test_helper'

class CommentLikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "commentLiked valid data" do
  		user = User.new({:email => "asdads@asdas.com", :admin => false, :password => "123456789", :password_confirmation => "123456789" })
		user.save
		attachment = File.new("test/fixtures/grey.jpg")
		post = Post.new({:title => "123456123456789123",:summary => "123456789123",:banner => attachment,:body => "123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123", :user_id =>user.id, :comment_enabled => 1, :important => 1})
		post.save
		comment = Comment.new({:user_id => user.id, :post_id => post.id, :comment => "Random text"})
		comment.save

		@log = CommentLike.new(user: user, comment: comment);
		assert @log.save
  end

end
