class ChangeSringToText < ActiveRecord::Migration
  def change
    change_column :notes, :notes, :text
  end
end
