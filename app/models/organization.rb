class Organization < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  has_many :events


  validates_presence_of :name

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :bio, :mission, :city, :state, :zip, :contact_email, :website, :twitter_handle, :facebook, :youtube, :logo, :avatar, :remote_avatar_url, :avatar_cache
  # attr_accessible :title, :body

end
