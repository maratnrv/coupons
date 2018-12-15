# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def use_coupon
    UserMailer.use_coupon(Coupon.first)
  end
end
