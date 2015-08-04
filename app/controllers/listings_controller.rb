class ListingsController < ApplicationController
	before_action :check_user, only: [:update, :destroy, :edit]

	def index
		@listings = Listing.all.order(created_at: :desc)
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.build(listing_params)
		
		if @listing.save
			redirect_to listings_path
		else
			render :new
		end

	end

	def show
		@listing = Listing.find(params[:id])
	end

	#def edit 
	#	@listing = current_user.listings.find(params[:id])
	#end

	#def update
	#	@listing = current_user.listings.find(params[:id])

	#	if @listing.update(listing_params)
	#		redirect_to listing_path(@listing)
	#	else
	#		render :edit
	#	end
	#end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to listings_path
	end

	private

	def listing_params
		params.require(:listing).permit(:product, :required_amount, :bulk_cost)
	end

end