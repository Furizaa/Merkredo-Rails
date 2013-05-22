class Event < ActiveRecord::Base
  attr_accessible :account_id, :date, :date_orig, :timezone, :token, :uid, :verified

  belongs_to :account
  has_many :attendees
  has_many :ratings
end
