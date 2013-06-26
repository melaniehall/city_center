class User < ActiveRecord::Base
  has_many :organizations
  has_many :attendees
  has_many :events, :through => :attendees
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :bio, :city, :state, :website, :twitter_handle, :facebook
  # attr_accessible :title, :body

  def is_attending?(event)
    if Attendee.where(:event_id => event.id, :user_id => self.id).first
      true
    else
      false
    end
  end
end
