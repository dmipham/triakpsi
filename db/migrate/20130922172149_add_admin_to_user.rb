class AddAdminToUser < ActiveRecord::Migration
  
  def self.up
    add_column :users, :admin, :boolean, :default => false
  end
  
  def self.down
    remoe_column :users, :admin
  end
  
end
