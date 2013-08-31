class AddContactCompanyToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :contact_company, :string
  end
end
