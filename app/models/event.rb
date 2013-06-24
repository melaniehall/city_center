class Event < ActiveRecord::Base
  belongs_to :organization

  attr_accessible :name, :description, :scheduled_on, :starts_at, :ends_at, :organization_id
  # validates :name, :description, :scheduled_on, :starts_at, :ends_at, :presence => true
  validates_presence_of :name, :scheduled_on, :starts_at
end

