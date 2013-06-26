require 'spec_helper'

describe User,"#is_attending?(event)" do
  context 'user is currently attending the event' do
    let!(:user) { FactoryGirl.create(:user) }
    subject { user.is_attending?(event) }
    let!(:event) { FactoryGirl.create(:event) }
    let!(:non_attending_user) { FactoryGirl.create(:user, :email => "user2@example.com") }
    let!(:attendee) { FactoryGirl.create(:attendee) }

    it 'returns true' do
      expect(subject).to be_true
    end
  end
  context 'user is currently attending the event' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:non_attending_user) { FactoryGirl.create(:user, :email => "user2@example.com") }
    subject { non_attending_user.is_attending?(event) }
    let!(:event) { FactoryGirl.create(:event) }
    let!(:attendee) { FactoryGirl.create(:attendee) }

    it 'returns false' do
      expect(subject).to be_false
    end
  end
end