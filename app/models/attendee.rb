class Attendee < ActiveRecord::Base
  belongs_to :events
  belongs_to :users

  attr_accessible :user_id, :event_id
  # validates :user_id, :uniqueness => { :scope => :event,
  #   :message => "can only register once for an event" }
end