class AddStripeColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :stripe, :string
  end
end
