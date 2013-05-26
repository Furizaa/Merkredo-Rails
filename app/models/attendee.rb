class Attendee < ActiveRecord::Base
  attr_accessible :email

  has_many :ratings
  has_many :events, through: :ratings

  validates :email, presence: true, uniqueness: { case_sensitive: true }

end
