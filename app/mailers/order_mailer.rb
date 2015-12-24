class OrderMailer < ActionMailer::Base
  default from: "admin@sadashopping.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    @product_items = @order.product_items
    mail to: @order.user.email, subject: "Order confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.dispatched.subject
  #
  def dispatched(order)
   @order = order
   @product_items = @order.product_items
   mail to: @order.user.email, subject: "Order dispatched"
  end
end
