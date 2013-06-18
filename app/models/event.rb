class Event < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :description, :date, :start_time, :end_time

  validates :name, :description, :date, :state_time, :end_time, :presence => true
end