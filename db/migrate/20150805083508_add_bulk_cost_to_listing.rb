class AddBulkCostToListing < ActiveRecord::Migration
  def change
    add_column :listings, :bulk_cost, :integer
  end
end
