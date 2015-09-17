class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def reservation_email(user)
    @user = user
    mail(to: @user.email, subject: "Reservation Successful")
  end
end
