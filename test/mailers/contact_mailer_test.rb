require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "send confirmation" do
  	#contactForm = ContactformsController.new({:title => "asdasd",:body => "asdadsdsa", :email => "asdads@asdadsa.com"})#
  	#contactForm.save
  	contactForm = ContactformsController.new({:title => "asdasd",:body => "asdadsdsa", :email => "asdads@asdadsa.com"})
  	email = ContactMailer.notify_contact_form(contactForm)
  	assert_emails 1 do
  		email.deliver_now
  	end
  end
end
