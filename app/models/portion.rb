class Portion < ActiveRecord::Base
	validates :share, numericality: {greater_than: 0}

	belongs_to :user
	belongs_to :listing
end
