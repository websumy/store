class SessionsController < ApplicationController

  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to orders_path
    else
      redirect_to login_path, notice: 'Invalid username or(and) password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: 'Logout succeed'
  end
end
