class Attendee < ActiveRecord::Base
  attr_accessible :email, :token

  belongs_to :event
  has_many :ratings

  after_initialize :create_token

  validates_presence_of :token
  validates :email, presence: true, uniqueness: { case_sensitive: true, scope: :event_id }

  private

  def create_token
    self.token = SecureRandom.hex(32)
  end

end
