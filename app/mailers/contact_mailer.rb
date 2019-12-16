require 'action_mailer'
ActionMailer::Base.delivery_method = :smtp
class ContactMailer < ApplicationMailer
	def notify_new_post(post)
		@post = post
		User.all.each do |user|
		  	ActionMailer::Base.mail(to:user.email, subject: "New news article!")
		end		
	end

	def notify_registration(user)
		@user = user;
		ActionMailer::Base.mail(to: user.email, subject: "Thanks for Registering")
	end

	def notify_contact_form(contactform)
		@contactform = contactform
		mail(to: contactform.email, subject: "Thanks for sending a contact form")

	end
end
