require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end\
	test "Less than 2 characters for title" do
		attachment = File.new("test/fixtures/grey.jpg")
		post = Post.new({:title => "1",:summary => "123456789123",:banner => attachment,:body => "123456789123", :user_id => 1, :comment_enabled => 1, :important => 1})

		assert_not post.save

	end
	test "No Valid user" do
		attachment = File.new("test/fixtures/grey.jpg")
		post = Post.new({:title => "1",:summary => "123456789123",:banner => attachment,:body => "123456789123", :user_id => 0, :comment_enabled => 1, :important => 1})

		assert_not post.save

	end
		test "Body is less than 10 Characters" do
		attachment = File.new("test/fixtures/grey.jpg")
		post = Post.new({:title => "1",:summary => "123456789123",:banner => attachment,:body => "1", :user_id => 0, :comment_enabled => 1, :important => 1})

		assert_not post.save

	end
	test "Valid arguments" do
		user = User.new({:email => "asdads@asdas.com", :admin => false, :password => "123456789", :password_confirmation => "123456789" })
		user.save
		attachment = File.new("test/fixtures/grey.jpg")
		post = Post.new({:title => "123456123456789123",:summary => "123456789123",:banner => attachment,:body => "123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123123456789123", :user_id =>user.id, :comment_enabled => 1, :important => 1})
# 		Rails::logger.debug "Errors"
# Rails::logger.debug post.errors.any?

# Rails::logger.debug user.errors.any?
# Rails::logger.debug user.id

# post.errors.each do |t,msg|
# Rails::logger.debug msg
# Rails::logger.debug t

# 	end
		assert post.save
	end

end
