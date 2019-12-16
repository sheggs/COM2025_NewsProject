require 'test_helper'

class AvatarTest < ActiveSupport::TestCase
 test "Valid Avatar Creation" do
 		attachment = File.new("test/fixtures/grey.jpg")

		user = User.new({:email => "asadsasd@asdasdasdas", :admin => false, :password => "123456789", :password_confirmation => "123456789" })
		user.save
		avatar = Avatar.new({:avatar => attachment, :user_id => user.id})


		assert avatar.save

	end
	 test "No attachment" do
 		attachment = ""
		user = User.new({:email => "asadsasd@asdasdasdas", :admin => false, :password => "123456789", :password_confirmation => "123456789" })
		user.save
		avatar = Avatar.new({:avatar => attachment, :user_id => user.id})

		assert_not avatar.save

	end

	test "No valid user" do
		attachment = File.new("test/fixtures/grey.jpg")
		avatar = Avatar.new({:avatar => attachment, :user_id => 0})
		assert_not avatar.save
	end

	
end
