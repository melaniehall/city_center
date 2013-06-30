class AttendeesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @event = Event.find(params[:format])
    @attendee = Attendee.create(:event_id => @event.id, :user_id => current_user.id)
    @organization = Organization.where(:id => @event.organization_id).first

    if @attendee.save
      flash.notice = "Your attendance has been saved"
      redirect_to organization_event_path(@organization, @event)
    else
      if Attendee.where(:user_id => current_user.id ).first
        flash.notice = "You are already attending this event."
        redirect_to organization_event_path(@organization, @event)
      else
        flash.notice = "Your attendence could not be saved, please try again."
        redirect_to organization_event_path(@organization, @event)
      end
    end
  end

  def destroy
    @event = Event.where(params[:format]).first
    @organization = Organization.where(:id => @event.organization_id).first

    if authentic_attendee
      authentic_attendee.destroy

      flash.notice = "You are no longer attending this event."
      redirect_to organization_event_path(@organization, @event)
    else
      flash.notice = "Please sign in as an authorized user"
      redirect_to root_path
    end
  end


  def authentic_attendee
    @event = Event.find(params[:id])
    Attendee.where(:user_id => current_user.id, :event_id => @event.id).first
  end
end