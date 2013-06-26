class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index

    if params[:organization_id]
      @organization = load_organization
      @events = @organization.events.all
      @events_by_date = @events.group_by(&:scheduled_on)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
    else
      @events = Event.all
      @organization = Organization.all
      @events_by_date = @events.group_by(&:scheduled_on)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
    end

  end

  def new
    @organization = load_organization
    unless @organization
      flash[:notice] = "Only organizations can create events. Please create an organization first."
      redirect_to root_path
    end
    @event = Event.new
  end

  def create
    @organization = Organization.where(:id => params[:organization_id]).first

    unless @organization
      flash[:notice] = "Only organizations can create events. Please create an organization first."
      redirect_to new_organization_path
    end

    if params[:event][:ends_at].blank?
      @event = @organization.events.new(params[:event])
    else
      @event = @organization.events.new(params[:event])
    end

    if @event.save
      flash.notice = "Your event has been created"
      @event = Event.where(params[:event]).first
      redirect_to organization_event_path(@organization, @event)
    else
      flash.now.notice = "Your event could not be created, please try again."
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @organization = Organization.where(:id => params[:organization_id]).first
    @attendees = Attendee.where(:event_id => @event.id)
  end

  def edit
    @organization = load_organization
    if @organization
      @events = @organization.events.all
      @event = @organization.events.where(:id => params[:id]).first
    else
      flash[:notice] = "Only authorized organizations can edit events."
      redirect_to new_organization_path
    end
  end

  def update
    @organization = load_organization
    if @organization
      @event = Event.find(params[:id])
      @event.update_attributes(params[:event])
      redirect_to organization_event_path(@organization, @event)
    else
      flash[:notice] = "Only authorized organizations can update events."
      redirect_to new_organization_path
    end
  end

  def destroy
    @organization = load_organization
    if @organization
      @event = Event.find(params[:id])
      @event.destroy
      flash[:notice] = "Your event has been deleted"
      redirect_to organization_path(@organization)
    else
      flash[:notice] = "Only authorized organizations can delete events."
      redirect_to root_path
    end
  end

  def load_organization
    Organization.where(:user_id => current_user.id, :id => params[:organization_id]).first
  end
end