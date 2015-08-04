class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: :index

  def total_claimed(portions)
  	sum = 0
  	portions.each do |portion|
  		sum += portion.share
  	end
  	sum
  end 

end