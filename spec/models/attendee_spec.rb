require 'spec_helper'

describe Attendee,"#user" do
  context 'a user exists' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:attendee) { FactoryGirl.create(:attendee) }
    let!(:event) { FactoryGirl.create(:event) }
    subject { attendee.user }


    it 'returns the user info of the attendee' do
      expect(subject).to eql(user)
    end
  end
end
