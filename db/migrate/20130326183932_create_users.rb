class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :string
      t.integer :grad_year
      t.string :school
      t.string :pledge_semester
      t.integer :pledge_year
      t.string :industry
      t.string :job_title
      t.string :company
      t.date :birthday
      t.string :linkedin
      t.string :twitter
      t.string :website
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
