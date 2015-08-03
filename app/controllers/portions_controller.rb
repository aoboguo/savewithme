class PortionsController < ApplicationController
	before_action :check_user, only: [:update, :destroy, :edit]

	def index
		binding.pry
		@portions = Portion.where(listing_id: params[:listing_id])
	end

	def new
	end

	def create
	end

# do we need this??
	def show
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

end