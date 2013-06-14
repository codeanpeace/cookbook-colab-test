class SessionsController < ApplicationController
  skip_before_filter :require_authentication
  def new
  end

  def create
    cook = Cook.find_by_email(params[:email])

    if cook && cook.authenticate(params[:password])
      session[:cook_id] = cook.id
      redirect_to root_path, :notice => "You are now logged in!"
    else
      flash.now[alert] = "Incorrect"
      render :new
    end
  end

  def destroy
    session[:cook_id] = nil
    redirect_to root_path, :notice => "You are now logged out!"
  end
end
