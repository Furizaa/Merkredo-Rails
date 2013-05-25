class Event < ActiveRecord::Base
  attr_accessible  :dtbegin, :dtend, :token, :uid, :name, :body

  belongs_to :account
  has_many :attendees
  has_many :ratings

  after_initialize :create_token
  before_validation :sanitize_name

  validates :name, length: { in: 0..64 }
  validates :dtbegin, presence: true
  validates :dtend, presence: true
  validates :token, presence: true, length: { is: 64 }
  validates :uid, presence: true, uniqueness: true

  def self.new_from_ical_event(ical_event)
    Event.new().merge_with_ical_event(ical_event)
  end

  def merge_with_ical_event(ical_event)
    self.dtbegin = ical_event.dtstart
    self.dtend = ical_event.dtend
    self.body = ical_event.description
    self.uid = ical_event.uid
    self
  end

  private

  def create_token
    self.token = SecureRandom.hex(32)
  end

  def sanitize_name
    self.name = '' unless self.name
    self.name.gsub!(/^[^A-Za-z0-9]+|[^A-Za-z0-9_]+$/, '')
    self.name.gsub!(/[^A-Za-z0-9_ ]+/, '_')
    self.name = self.name[0, 64]
  end

end
