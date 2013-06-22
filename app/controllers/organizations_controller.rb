class OrganizationsController < ApplicationController

  # before_filter :authenticate_user!

  # def index
  #   @organizations = Organization.all
  # end

  def new
    @organization = Organization.new
  end

  def create
    organization = current_user.organizations.create!(params[:organization])

    if organization.persisted?
      flash.notice = "Your organization has been created"
      redirect_to organization_path(organization)
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  # def edit
  #   @organization = Organization.find(params[:id])
  # end

  # def update
  #   @organization = Organization.find(params[:id])
  #   @organization.update_attributes(params[:organization])
  #   redirect_to organization_path
  # end

  # private

  # def organization
  #   Organization.where(:user_id => current_user.id, :id => params[:id]).first
  # end
end