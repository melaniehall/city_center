class Event < ActiveRecord::Base
  has_many :users, :through => :attendees

  attr_accessible :name, :description, :scheduled_on, :starts_at, :ends_at, :organization_id
  # validates :name, :description, :scheduled_on, :starts_at, :ends_at, :presence => true
end