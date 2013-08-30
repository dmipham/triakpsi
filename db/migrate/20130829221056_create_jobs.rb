class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :industry
      t.string :company
      t.string :position
      t.string :description
      t.string :compensation
      t.string :website

      t.timestamps
    end
  end
end
