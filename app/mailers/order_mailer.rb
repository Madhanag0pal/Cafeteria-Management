class OrderMailer < ApplicationMailer
  def order_details(user, cart_items)
    @user = user
    @cart_items = cart_items
    mail to: user.email, subject: "Order Details"
  end
end
