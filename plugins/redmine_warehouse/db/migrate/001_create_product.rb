class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :issue_id
      t.float :cost
      t.integer :quantity
      t.datetime :date_production
    end
  end
end
