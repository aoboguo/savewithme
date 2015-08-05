class Listing < ActiveRecord::Base
	validates :product, presence: true
	validates :required_amount, :bulk_cost, numericality: {greater_than: 0}


	has_many :portions
	has_many :users, through: :portions

  def cost_per_person(num_people)
    ((bulk_cost / num_people.to_f) * 100).ceil / 100.0
  end
end
