class RemoveBulkCostFromListing < ActiveRecord::Migration
  def change
    remove_column :listings, :bulk_cost, :decimal
  end
end
