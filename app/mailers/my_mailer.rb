class My_Mailer < ActionMailer::Base
  default :from => "no-reply@Moonlyt.com"

  def confirm_email(user)
  	@user = user
	mail(:to => user.email, :subject => "Confirmation")
  end
end
