class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_authentication
  before_filter :setup_twilio_client

  require "open-uri"

  def setup_twilio_client
    if @twilio_client.nil?
      @twilio_client = Twilio::REST::Client.new(
        ENV["TWILIO_ID"], ENV["TWILIO_SECRET"]
      )
    end
  end

  def current_cook
    if session[:cook_id]
      @current_cook = Cook.find(session[:cook_id])
    end
  end

  def require_authentication
    if current_cook.nil?
      redirect_to root_path, :alert => "You need to be logged in."
    end
  end

  helper_method :current_cook
  #allows views to access this method by creating a corresponding helper_method
end
