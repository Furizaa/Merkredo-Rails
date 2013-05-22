class Attendee < ActiveRecord::Base
  attr_accessible :email, :event_id, :token

  belongs_to :event
  has_many :ratings
end
