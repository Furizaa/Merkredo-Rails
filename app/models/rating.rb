class Rating < ActiveRecord::Base
  attr_accessible :roti, :shout, :token

  belongs_to :attendee
  belongs_to :event

  after_initialize :create_token

  validates :token, presence: true, length: { is: 64 }

  private

  def create_token
    self.token = SecureRandom.hex(32)
  end

end
