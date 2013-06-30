class HomeController < ApplicationController
  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:scheduled_on)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @attendees = Attendee.all
  end


end