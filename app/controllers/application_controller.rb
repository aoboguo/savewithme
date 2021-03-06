class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: :index
  before_action :configure_permitted_parameters, if: :devise_controller?

  def disable_nav
    @disable_nav = true
  end

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

    def cost_per_person(listing, shares_of_person)
      (((listing.bulk_cost / listing.required_amount.to_f) * shares_of_person) * 100).ceil / 100.0
    end

end