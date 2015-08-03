class CreatePortions < ActiveRecord::Migration
  def change
    create_table :portions do |t|
      t.belongs_to :listing, index: true
      t.belongs_to :user, index: true
      t.integer :share

      t.timestamps null: false
    end
  end
end
