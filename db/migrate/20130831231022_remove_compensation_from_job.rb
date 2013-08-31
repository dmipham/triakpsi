class RemoveCompensationFromJob < ActiveRecord::Migration
  def up
    remove_column :jobs, :compensation
  end

  def down
    add_column :jobs, :compensation, :string
  end
end
