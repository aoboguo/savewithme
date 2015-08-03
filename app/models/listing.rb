class Listing < ActiveRecord::Base
	has_many :portions
	has_many :users, through: :portions
end
