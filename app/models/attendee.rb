class Attendee < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user_id

  attr_accessible :user_id, :event_id

  def user
    User.where(:id => self.user_id).first
  end

end
