class AttendeesController < ApplicationController

  def new
    @attendee = Attendee.new
  end

  def create
    @event = Event.find(params[:id])
    @user = current_user
    @attendee = Attendee.create(event_id: @event.id], user_id: @user.id)
    flash[:notice] = "Your RSVP has been added"
    redirect_to event_path(:event)
  end

end