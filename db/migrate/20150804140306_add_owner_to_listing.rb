class AddOwnerToListing < ActiveRecord::Migration
  def change
    add_column :listings, :owner, :string
  end
end
