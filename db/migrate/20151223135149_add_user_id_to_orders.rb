class AddUserIdToOrders < ActiveRecord::Migration
  def up
  	Order.delete_all
  	remove_column :orders, :name
  	remove_column :orders, :email
  	add_column :orders, :user_id, :integer
  end

  def down
  	Order.delete_all
  	remove_column :orders, :user_id
    add_column :orders, :name, :string
  	add_column :orders, :email, :string
  end	
end
