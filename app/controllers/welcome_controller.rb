class WelcomeController < ApplicationController

	def index
		@listings = Listing.all.order(created_at: :desc)
	end 

end
