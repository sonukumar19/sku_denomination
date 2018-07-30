# class for send sku combination mail
class SkuCombinationNotificationMailer < ActionMailer::Base
  # default :from => admin_user.email
  def send_email(user)
    mail(from: "sku@yopmail.com",
      to: user.email,
      subject: 'Sku Combination notification'
    )
  end
end
