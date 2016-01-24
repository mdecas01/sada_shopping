class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.references :product, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
