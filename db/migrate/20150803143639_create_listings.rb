class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :product
      t.integer :required_amount
      t.float :bulk_cost

      t.timestamps null: false
    end
  end
end
