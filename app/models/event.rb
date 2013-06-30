class Event < ActiveRecord::Base
  belongs_to :organization
  has_many :attendees, :dependent => :destroy
  has_many :users, :through => :attendees

  attr_accessible :name, :description, :venue, :scheduled_on, :starts_at, :ends_at, :organization_id, :organizer, :contact_email
  # validates :name, :description, :scheduled_on, :starts_at, :ends_at, :presence => true
  validates_presence_of :name, :scheduled_on, :venue, :starts_at, :ends_at

  def parent_organization
    Organization.where(:id => self.organization_id).first
  end
end
