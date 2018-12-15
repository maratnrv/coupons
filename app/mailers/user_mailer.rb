class UserMailer < ApplicationMailer
  default from: 'my.mailer.acc@gmail.com'
  default to: 'maratnrv@gmail.com'

  def use_coupon(coupon)
    @coupon = coupon
    mail(subject: 'Welcome to My Awesome Site')
  end
end
