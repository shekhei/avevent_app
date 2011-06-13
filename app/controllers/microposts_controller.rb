class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    @event = params[:micropost][:event_id]
    if @micropost.save
      # flash[:success] = "Post Saved"
      redirect_to event_path(@event)
    else
      flash[:error] = "Wrong Save"
      redirect_to event_path(@event)
    end
  end
    
  def destroy
  end

end
  