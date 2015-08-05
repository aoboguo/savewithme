class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: :index
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :phone_number, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :phone_number, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :phone_number, :password, :password_confirmation, :current_password) }
  end
  

  private 

    def total_claimed(portions)
  	 sum = 0
  	   portions.each do |portion|
  	     sum += portion.share
  	   end
  	 sum
    end 

    def total_claimed_minus_self(portions, mine)
     sum = 0
       portions.each do |portion|
         sum += portion.share
       end
     sum - mine.share
    end 

    # def share_exceeds(remaining, portion)
    #   too_big = false
    #   if portion.share > remaining
    #     too_big = true
    #     flash[:alert] = "You have claimed too many portions."
    #   end
    #   too_big
    # end 

end