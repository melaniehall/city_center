class Event < ActiveRecord::Base
  belongs_to :organization
  has_many :attendees
  has_many :users, :through => :attendees

  attr_accessible :name, :description, :venue, :scheduled_on, :starts_at, :ends_at, :organization_id
  # validates :name, :description, :scheduled_on, :starts_at, :ends_at, :presence => true
  validates_presence_of :name, :scheduled_on, :venue, :starts_at, :ends_at

end
