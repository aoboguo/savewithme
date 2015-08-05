class PortionsController < ApplicationController
	before_action :check_owner, only: [:edit, :update, :destroy]

	def index
		@listing = Listing.find(params[:listing_id])
		@portions = Portion.where(listing_id: params[:listing_id])
	end

	def new
		@listing = Listing.find(params[:listing_id])
		# MAYBE DON'T NEED THIS
		@portion = Portion.new
		@portions = @listing.portions
		@remaining = @listing.required_amount - total_claimed(@portions)
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@new_portion = @listing.portions.build(portion_params)
		@new_portion.user_id = current_user.id
		@portions = @listing.portions
		@remaining = @listing.required_amount - total_claimed(@portions)

		# if share_exceeds(@remaining, @new_portion)
		# 	render :new
		if @new_portion.save
			redirect_to listing_path(@listing)
		else
			render :new	
		end
	end

	def edit
		@listing = Listing.find(params[:listing_id])
		@portion = current_user.portions.find(params[:id])
		@portions = @listing.portions
		@my_portions = current_user.portions.where(listing_id: params[:listing_id]).first
		@remaining = @listing.required_amount - total_claimed_minus_self(@portions, @my_portions)
	end

	def update
		@listing = Listing.find(params[:listing_id])
		@portion = current_user.portions.find(params[:id])

		@portions = @listing.portions
		# @remaining = @listing.required_amount - total_claimed(@portions)

		# if share_exceeds(@remaining, @portion)
		# 	render :new
		if @portion.update(portion_params)
			redirect_to listing_path(@listing)
		else
			render :edit
		end
	end

	def destroy
		@portion = Portion.find(params[:id])
		@portion.destroy
		redirect_to listing_path(params[:listing_id])
	end

	private

		def portion_params
			params.require(:portion).permit(:share)
		end

		def check_owner
  		unless current_user.id == Portion.find(params[:id]).user_id
  			flash[:alert] = "You must have created the portion in order to edit or delete it."
  			redirect_to listing_path(params[:id])
  		end

  	end 

end