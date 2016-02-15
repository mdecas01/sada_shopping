class ProductMailer < ActionMailer::Base
  default from: "admin@sadashopping.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def quantity_low(product)
    @product = product
    mail to: "romacas@hotmail.co.uk", subject: "Product quantity low"
  end
end