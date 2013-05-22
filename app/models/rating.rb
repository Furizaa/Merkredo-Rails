class Rating < ActiveRecord::Base
  attr_accessible :attendee_id, :event_id, :roti, :shout

  belongs_to :attendee
  belongs_to :event
end
