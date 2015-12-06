class ChangeDispatchedTypeInOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :dispatched, :string
  end
end
