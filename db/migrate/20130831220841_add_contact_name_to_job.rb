class AddContactNameToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :contact_name, :string
  end
end
