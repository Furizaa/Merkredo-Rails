class Account < ActiveRecord::Base
  attr_accessible :email, :gender

  belongs_to :company

  validates_presence_of :company_id
  validates :email, presence: true, email: true
  validate :validate_real_name

  def validate_real_name
    test = /[\$\"\!§%&\\\/\(\)=\?\*\+\#\@0-9]/i
    if first_name =~ test
      errors.add(:first_name, 'invalid')
    end
    if last_name =~ test
      errors.add(:last_name, 'invalid')
    end
  end
end
