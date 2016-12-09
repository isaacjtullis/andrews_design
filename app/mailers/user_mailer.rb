class UserMailer < ActionMailer::Base
  default from: 'from@example.com'

  def new_contact(user)
    @user = user
    mail(
      to: 'diversion101@gmail.com',
      subject: "Contact: #{@user.first_name}"
    )
  end
end
