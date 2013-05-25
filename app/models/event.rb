class Event < ActiveRecord::Base
  attr_accessible  :date, :date_orig, :timezone, :token, :uid, :name, :body

  belongs_to :account
  has_many :attendees
  has_many :ratings

  after_initialize :create_token
  before_validation :sanitize_name

  validates :name, length: { in: 0..64 }
  validates :date, presence: true
  validates :date_orig, presence: true
  validates :timezone, presence: true, length: { in: 1..24 }
  validates :token, presence: true, length: { is: 64 }
  validates :uid, presence: true, uniqueness: true

  def self.new_from_ical_event(ical_event, ical_timezone)
    Event.new().merge_with_ical_event(ical_event, ical_timezone)
  end

  def merge_with_ical_event(ical_event, ical_timezone)
    time_zone_fix = ical_event.dtstart.strftime('%a, %e %b %Y %H:%M:%S ') + ical_timezone.tzoffsetfrom
    self.date = Time.zone.parse(time_zone_fix)
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
