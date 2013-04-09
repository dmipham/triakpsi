class Event < ActiveRecord::Base
  attr_accessible :end_at, :name, :start_at, :description, :link, :host
  has_event_calendar
end
