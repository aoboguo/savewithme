class Listing < ActiveRecord::Base
	validates :product, presence: true
	validates :required_amount, :bulk_cost, numericality: {greater_than: 0}


	has_many :portions
	has_many :users, through: :portions

  def cost_per_person(shares_of_person)
    (((bulk_cost / required_amount.to_f) * shares_of_person) * 100).ceil / 100.0
  end
end
