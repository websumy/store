class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected
  def record_not_found
    redirect_to store_url, notice: "Object with id #{params[:id]} not found"
  end

  def current_cart
    @cart ||= Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @cart.id if session[:cart_id].nil?
    @cart
  end

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: 'Please, login'
    end
  end

end
