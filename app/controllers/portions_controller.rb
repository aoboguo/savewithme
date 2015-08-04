class PortionsController < ApplicationController
	before_action :check_user, only: [:update, :destroy, :edit]

	def index
		@portions = Portion.where(listing_id: params[:listing_id])
		@product = @portions[0].listing.product
		@remaining = @portions[0].listing.required_amount - total_claimed(@portions)
	end

	def new
		@portion = Portion.new
		@listing = Listing.find(params[:listing_id])
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@portion = @listing.portions.build(portion_params)
		@portion.user_id = current_user.id
		if @portion.save
			redirect_to listing_portions_path
		else
			render :new
		end
	end

	#def edit 
	#end

	#def update
	#end

	def destroy
	end

	private

		def portion_params
			params.require(:portion).permit(:share)
		end

		def total_claimed(portions)
			sum = 0
			portions.each do |portion|
				sum += portion.share
			end
			sum
		end 

end