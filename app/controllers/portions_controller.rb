class PortionsController < ApplicationController
	before_action :check_owner, only: [:edit, :update, :destroy]

	def index
		@portions = Portion.where(listing_id: params[:listing_id])
		@listing = Listing.find(params[:listing_id])
	end

	def new
		@portion = Portion.new
		@listing = Listing.find(params[:listing_id])
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@portion = @listing.portions.build(portion_params)
		@existing_portion = current_user.portions.where(listing_id: params[:listing_id])
		@existing_portion = @existing_portion[0]
		if @existing_portion.present?
			@existing_portion.share += @portion.share
			@portion.destroy

			current_user.portions.where(listing_id: params[:listing_id])[0].update_attributes(:share => @existing_portion.share)

			redirect_to listing_path(@listing)
		else
			@portion.user_id = current_user.id
			if @portion.save
				redirect_to listing_path(@listing)
			else
				render :new
			end
		end
	end

	def edit
		@portion = current_user.portions.find(params[:id])
		@listing = Listing.find(params[:listing_id])
	end

	def update
		@portion = current_user.portions.find(params[:id])

		if @portion.update(portion_params)
			redirect_to listings_path
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