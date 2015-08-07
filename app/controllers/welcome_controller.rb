class WelcomeController < ApplicationController
	before_filter :disable_nav, only: [:index]

	def index
		@listings = Listing.all.order(created_at: :desc)
	end 

end
