class JtjMailer < ApplicationMailer
  default from: 'makesh@coldwatersl.com'

  def contact(user)
    @name=user[:name]
    @email=user[:email]
    @comment=user[:comment]
    @subject="Contact from #{user[:name]}"
    mail(to: 'info@theporch.live', subject: @subject)
  end

end