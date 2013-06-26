FactoryGirl.define do
  factory :event do
    name "My New Event"
    description "My Event Description"
    organization_id "1"
    scheduled_on "2013-06-15"
    venue "Venue1"
    starts_at "6:00:00"
    ends_at "7:00:00"
  end
end