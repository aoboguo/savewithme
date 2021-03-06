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

User.create! username: "kleog", password: "password", password_confirmation: "password", phone_number: "284-123-4920", email: "email1@email.com"
User.create! username: "aobog", password: "password", password_confirmation: "password", phone_number: "846-753-0924", email: "email2@email.com"
User.create! username: "carol_from_once", password: "password", password_confirmation: "password", phone_number: "846-753-0924", email: "carol@carol.com"
puts "Creating users..."


Listing.create! product: "eggs", required_amount: 30, bulk_cost: 85, owner: User.first.username
Listing.create! product: "papayas", required_amount: 3, bulk_cost: 30, owner: User.second.username
Listing.create! product: "toilet paper", required_amount: 18, bulk_cost: 105, owner: User.first.username
Listing.create! product: "nappies", required_amount: 108, bulk_cost: 260, owner: User.first.username
Listing.create! product: "soap", required_amount: 4, bulk_cost: 30, owner: User.second.username
puts "Creating listings..."


Portion.create! listing_id: Listing.first.id, user_id: User.first.id, share: 5
Portion.create! listing_id: Listing.second.id, user_id: User.first.id, share: 2
Portion.create! listing_id: Listing.first.id, user_id: User.second.id, share: 3
Portion.create! listing_id: Listing.third.id, user_id: User.second.id, share: 10
Portion.create! listing_id: Listing.fourth.id, user_id: User.first.id, share: 24
Portion.create! listing_id: Listing.fourth.id, user_id: User.second.id, share: 60
Portion.create! listing_id: Listing.fifth.id, user_id: User.first.id, share: 2
puts "Creating portions..."