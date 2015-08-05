class ChangeBulkCostScale < ActiveRecord::Migration
  def change
    change_column :listings, :bulk_cost, :decimal, precision: 8, scale: 2
  end
end
