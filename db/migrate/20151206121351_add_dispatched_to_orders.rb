class AddDispatchedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :dispatched, :boolean
  end
end
