class Note < ActiveRecord::Base
  attr_accessible :board, :location, :members, :new_members, :next_meeting, :notes, :start, :name
end
