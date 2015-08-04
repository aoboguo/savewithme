class PortionsController < ApplicationController
	before_action :check_owner, only: [:update, :destroy, :edit]

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

			redirect_to listing_portions_path
		else
			@portion.user_id = current_user.id
			if @portion.save
				redirect_to listing_portions_path
			else
				render :new
			end
		end
	end

	# def edit 
	# end

	#def update
	#end

	def destroy
	end

	private

		def portion_params
			params.require(:portion).permit(:share)
		end

		

end