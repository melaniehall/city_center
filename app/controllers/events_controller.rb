class EventsController < ApplicationController
  before_filter :authenticate_organization!, :except => [:show, :index]
  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:scheduled_on)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @event = Event.new
  end

  def create
    @events = current_organization.events.all
    @event = current_organization.events.create(params[:event])
    flash[:notice] = "Your event has been added"
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
    @organizations = Organization.where(id: @event.organization_id)
    @organization = @organizations.each do |org|
      org
    end
  end

  def destroy
    @event = Event.find(params[:id])
    # @organization = Organization.where(id: @event.organization_id)

    @event.destroy
    flash[:notice] = "Your event has been deleted"
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:organization])
    redirect_to event_path
  end

end