class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :board
      t.string :members
      t.string :new_members
      t.time :start
      t.string :notes
      t.datetime :next_meeting
      t.string :location

      t.timestamps
    end
  end
end
