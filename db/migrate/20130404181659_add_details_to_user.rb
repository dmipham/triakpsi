class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :school, :string
    add_column :users, :grad_year, :integer
    add_column :users, :pledge_year, :integer
    add_column :users, :pledge_semester, :string
    add_column :users, :industry, :string
    add_column :users, :company, :string
    add_column :users, :phone, :string
    add_column :users, :job_title, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string
    add_column :users, :website, :string
  end
end
