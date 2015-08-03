class Portion < ActiveRecord::Base
	validates :shares, numericality: {greater_than: 0}

	belongs_to :user
	belongs_to :listing
end
