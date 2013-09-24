class Event < ActiveRecord::Base
  attr_accessible :end_at, :name, :start_at, :description, :link, :host, :color, :location
  has_event_calendar
  
  def to_ics
    event = Icalendar::Event.new
    event.start = self.start_at.strftime("%Y%m%dT%H%M%S")
    event.end = self.end_at.strftime("%Y%m%dT%H%M%S")
    event.summary = self.name
    event.description = self.description
    event.location = self.location
    event.uid = event.url = self.link
    event.klass = "PUBLIC"
    event.add_comment("We look forward to seeing you there!")
    event
  end
  
end
