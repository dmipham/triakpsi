class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  
  before_filter :authenticate_user!, :except => [:index, :show]
  
  require 'icalendar'
  
  def export_events
      @event = Event.find(params[:id])
      @calendar = Icalendar::Calendar.new
      event = Icalendar::Event.new
      event.start = @event.start_at.strftime("%Y%m%dT%H%M%S")
      event.end = @event.end_at.strftime("%Y%m%dT%H%M%S")
      event.summary = @event.name
      event.description = @event.description
      event.location = @event.location
      @calendar.add event
      @calendar.publish
      headers['Content-Type'] = "text/calendar; charset=UTF-8"
      render_without_layout :text => @calendar.to_ical
    end
  
  def index
    @events = Event.all
    @upcoming_events = Event.where("start_at > ?", Date.today.to_date).sort_by{ |d| d.start_at }
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
      format.ics do
        calendar = Icalendar::Calendar.new
        calendar.add_event(@event.to_ics)
        calendar.publish
        render :text => calendar.to_ical
      end
    end
    
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
     
    if @event.host == "Triangle AKPsi" 
      @event.update_attribute(:color, "#ffcc00")
    elsif  @event.host == "NCSU"
      @event.update_attribute(:color, "#e50000")
    else
      @event.update_attribute(:color, "#87cefa")
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
