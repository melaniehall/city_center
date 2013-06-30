class OrganizationsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = current_user.organizations.create(params[:organization])

    if @organization.persisted?
      flash.notice = "Your organization has been created"
      redirect_to organization_path(@organization)
    else
      flash.notice = "Your organization could not be created"
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])
    @events = @organization.events.all
  end

  def edit
    @organization = load_organization
    unless @organization
      flash[:notice] = "You are not permitted to edit this organization"
      redirect_to root_path
    end
  end

  def update
    @organization = load_organization
    if @organization
      @organization.update_attributes(params[:organization])
      redirect_to organization_path
    else
      flash[:notice] = "You are not permitted to update this organization"
      redirect_to root_path
    end
  end

  def destroy
    @organization = load_organization
    unless @organization
      flash[:notice] = "You are not permitted to delete this organization"
      redirect_to root_path
    end
    @organization.events.each do |event|
      event.delete
    end

    @organization.delete
    flash[:notice] = "Your organization has been deleted."
    redirect_to root_path
  end

  private

  def load_organization
    Organization.where(:user_id => current_user.id, :id => params[:id]).first
  end
end


