class AddBulkcostToListing < ActiveRecord::Migration
  def change
    add_column :listings, :bulk_cost, :decimal
  end
end
