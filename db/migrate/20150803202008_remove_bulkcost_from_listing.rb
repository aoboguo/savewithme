class RemoveBulkcostFromListing < ActiveRecord::Migration
  def change
    remove_column :listings, :bulk_cost, :float
  end
end
