require 'test_helper'

class UserTest < ActiveSupport::TestCase 
	test "Shouldn't make user without email" do
		user = User.new({:email => "", :admin => false, :password => "123456789", :password_confirmation => "123456789" })
		assert_not user.save

	end
	test "All fields are valid" do
		user = User.new({:email => "asdads@asdas.com", :admin => false, :password => "123456789", :password_confirmation => "123456789" })
		assert user.save
	end
	
end
