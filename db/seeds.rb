# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Listing.destroy_all
Portion.destroy_all

User.create! username: "kleog", password: "password", password_confirmation: "password", phone_number: "284-123-4920", email: "email@email.com"
User.create! username: "aobog", password: "password", password_confirmation: "password", phone_number: "846-753-0924", email: "email@email.com"
puts "Creating users..."


Listing.create! product: "eggs", required_amount: 20, bulk_cost: 100
Listing.create! product: "chips", required_amount: 10, bulk_cost: 80
puts "Creating listings..."


Portion.create! listing_id: Listing.first, user_id: User.first, share: 5
Portion.create! listing_id: Listing.second, user_id: User.first, share: 2
Portion.create! listing_id: Listing.first, user_id: User.second, share: 3
Portion.create! listing_id: Listing.second, user_id: User.second, share: 6
puts "Creating portions..."