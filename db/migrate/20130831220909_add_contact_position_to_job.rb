class AddContactPositionToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :contact_position, :string
  end
end
