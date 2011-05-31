class RsvpsController < ApplicationController
  before_filter :authenticate
  # GET /rsvps
  # GET /rsvps.xml
  def index
    @rsvps = Rsvp.all

    respond_to do |format|
      format.html index.html.erb
      format.xml  { render :xml => @rsvps }
    end
  end

  # GET /rsvps/1
  # GET /rsvps/1.xml
  def show
    @rsvp = Rsvp.find(params[:id])

    respond_to do |format|
      format.html show.html.erb
      format.xml  { render :xml => @rsvp }
    end
  end

  # GET /rsvps/new
  # GET /rsvps/new.xml
  def new
    @rsvp = Rsvp.new

    respond_to do |format|
      format.html new.html.erb
      format.xml  { render :xml => @rsvp }
    end
  end

  # GET /rsvps/1/edit
  def edit
    @rsvp = Rsvp.find(params[:id])
  end

  # POST /rsvps
  # POST /rsvps.xml
  def create
    event = Event.find(params[:rsvp][:event_id])
    current_user.attend!(event)
    redirect_to event_path(event.id), :notice => 'Your RSVP has been saved'
    #respond_to do |format|
    #  if @rsvp.save
    #    format.html { redirect_to(@rsvp, :notice => 'Rsvp was successfully created.') }
    #    format.xml  { render :xml => @rsvp, :status => :created, :location => @rsvp }
    #  else
    #    format.html { render :action => "new" }
    #    format.xml  { render :xml => @rsvp.errors, :status => :unprocessable_entity }
    #  end
    #end
  end

  # PUT /rsvps/1
  # PUT /rsvps/1.xml
  def update
    @rsvp = Rsvp.find(params[:id])

    respond_to do |format|
      if @rsvp.update_attributes(params[:rsvp])
        format.html { redirect_to(@rsvp, :notice => 'Rsvp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rsvp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.xml
  def destroy
    event = Rsvp.find(params[:id]).event_id
    current_user.unattend!(event)
    redirect_to event_path(event.id), :notice => 'Rsvp status changed successfully.'
    #respond_to do |format|
    #  format.html { redirect_to(rsvps_url) }
    #  format.xml  { head :ok }
    #end
  end
end
