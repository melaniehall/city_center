require 'spec_helper'

describe EventsController do
  include Devise::TestHelpers
    let(:user) { FactoryGirl.create(:user) }
    let(:organization) { FactoryGirl.create(:organization, :user_id => user.id) }
    let(:event) { FactoryGirl.create(:event, :organization_id => organization.id) }
    let(:non_owner) { FactoryGirl.create(:user, :email => 'otheruser@example.com') }

  context '#PUT' do
    it 'does not allow someone who does not manage the event to update it' do

      sign_in non_owner
      put :update, :organization_id => organization.id, :id => event.id

      flash[:notice].should have_content "Only authorized organizations"
      response.should redirect_to new_organization_path
    end
  end
end