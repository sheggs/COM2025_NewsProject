require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "With Post test" do
  	user = User.new({:email => "asdads@asdas.com", :admin => false, :password => "123456789", :password_confirmation => "123456789" })
		user.save
		attachment = File.new("test/fixtures/grey.jpg")
		post = Post.new({:title => "123456123456789123",:summary => "123456789123",:banner => attachment,:body => "123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123", :user_id =>user.id, :comment_enabled => 1, :important => 1})
		post.save
		comment = Comment.new({:user_id => user.id, :post_id => post.id, :comment => "Random text"})
		assert comment.save
	end
	  test "With Post Test. Invalid Data" do
		attachment = File.new("test/fixtures/grey.jpg")
		post = Post.new({:title => "123456123456789123",:summary => "123456789123",:banner => attachment,:body => "123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123", :user_id =>0, :comment_enabled => 1, :important => 1})
		post.save
		comment = Comment.new({:user_id => 2, :post_id => 3, :comment => "Random text"})
		assert_not comment.save
	end
end
