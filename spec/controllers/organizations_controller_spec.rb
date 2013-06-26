require 'spec_helper'

describe OrganizationsController do
  include Devise::TestHelpers

  context '#PUT' do
    it 'does not allow someone who does not own the organization to update it' do
      user         = FactoryGirl.create(:user)
      organization = FactoryGirl.create(:organization, :user_id => user.id)

      non_owner    = FactoryGirl.create(:user, :email => 'otheruser@example.com')

      sign_in non_owner
      put :update, :id => organization.id

      flash[:notice].should have_content "not permitted"
      response.should redirect_to root_path
    end
  end
end