class OrderMailer < ApplicationMailer
  default from: 'depot@gmail.com'

  def order_to_user(order)
    @order = order
    mail(to: @order.email, subject: 'Order from Depot')
  end
end
