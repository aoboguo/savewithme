class ListingsController < ApplicationController
	before_action :check_owner, only: [:edit, :update, :destroy]

	def index
		@listings = Listing.all.order(created_at: :desc)
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.build(listing_params)
		@listing.owner = current_user.username
		
		if @listing.save
			redirect_to listings_path
		else
			render :new
		end

	end

	def show
		@listing = Listing.find(params[:id])
		@portions = @listing.portions
		@remaining = @portions[0].listing.required_amount - total_claimed(@portions)
		
		@owns = false
		if @listing.owner == current_user.username
			@owns = true
		end

		@joined = false
		@this_portion = current_user.portions.where(listing_id: params[:id])
		if @this_portion.present?
			@joined = true
		end

	end

	def edit 
		@listing = current_user.listings.find(params[:id])
	end

	def update
		@listing = current_user.listings.find(params[:id])

		if @listing.update(listing_params)
			redirect_to listing_path(@listing)
		else
			render :edit
		end
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to listings_path
	end


	private

		def listing_params
			params.require(:listing).permit(:product, :required_amount, :bulk_cost)
		end

		def check_owner
  		unless current_user.username == Listing.find(params[:id]).owner
  			flash[:alert] = "You must have created the listing in order to edit or delete it."
  			redirect_to listing_path(params[:id])
  		end
  	end

end