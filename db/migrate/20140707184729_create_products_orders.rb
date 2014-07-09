class CreateProductsOrders < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
      t.belongs_to :product
      t.belongs_to :order

      t.timestamps
    end
  end
end
