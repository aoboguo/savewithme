class Listing < ActiveRecord::Base
	validates :product, presence: true
	validates :required_amount, :bulk_cost, numericality: {greater_than: 0}


	has_many :portions
	has_many :users, through: :portions
	
end
