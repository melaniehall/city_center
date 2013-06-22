class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :events


  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :bio, :mission, :city, :state, :zip, :contact_email, :website, :twitter_handle, :facebook, :youtube, :logo
  # attr_accessible :title, :body
end
