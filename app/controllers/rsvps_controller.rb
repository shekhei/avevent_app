class RsvpsController < ApplicationController
  #before_filter :authenticate
  # GET /rsvps
  # GET /rsvps.xml
  def index
    @rsvps = Rsvp.all
  end

  # GET /rsvps/1
  # GET /rsvps/1.xml
  def show
    @rsvp = Rsvp.find(params[:id])

  end

  # GET /rsvps/new
  # GET /rsvps/new.xml
  def new
    @rsvp = Rsvp.new
  end

  # GET /rsvps/1/edit
  def edit
    @rsvp = Rsvp.find(params[:id])
  end

  # POST /rsvps
  # POST /rsvps.xml
  def create
    @event = Event.find(params[:rsvp][:event_id])
    note = params[:rsvp][:notes]
    if @event.vacancy?
      current_user.attend!(@event, note)
      redirect_to event_path(@event), :notice => "RSVP Saved"
    else
      redirect_to event_path(@event), :alert => "Sorry, No more vacancy for this event"
    end
    #@rsvp = Rsvp.new(params[:rsvp])
  end

  # PUT /rsvps/1
  # PUT /rsvps/1.xml
  def update
    @rsvp = Rsvp.find(params[:id])
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.xml
  def destroy
    @event = Rsvp.find(params[:id]).event_id
    current_user.unattend!(@event)
    redirect_to event_path(@event), :notice => "RSVP Saved"
  end
end