class Organization < ActiveRecord::Base
  has_many :events

  has_many :users, :through => :events
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :bio, :mission, :city, :state, :zip, :contact_email, :website, :twitter_handle, :facebook, :youtube, :logo
  # attr_accessible :title, :body
end
