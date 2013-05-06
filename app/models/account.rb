require_dependency 'pbkdf2'

class Account < ActiveRecord::Base
  attr_accessible :email, :gender, :password

  belongs_to :company

  validates_presence_of :company_id
  validates_presence_of :email
  validates :email, email: true
  validate :validate_real_name
  validate :validate_password

  before_save :ensure_password_is_hashed

  def password=(password)
    @raw_password = password unless password.blank?
  end

  def confirm_password?(password)
    return false unless password_hash && salt
    self.password_hash == hash_password(password, salt)
  end

  private

  def hash_password(password, salt)
    Pbkdf2.hash_password(password, salt, Rails.configuration.pbkdf2_iterations)
  end

  def ensure_password_is_hashed
    if @raw_password
      self.salt = SecureRandom.hex(16)
      self.password_hash = hash_password(@raw_password, salt)
    end
  end

  def validate_real_name
    test = /[\$"!§%&\\\/\(\)=\?\*\+#\@0-9]/i
    if first_name =~ test
      errors.add(:password, 'invalid')
    end
    if last_name =~ test
      errors.add(:password, 'invalid')
    end
  end

  def validate_password
    if (!@raw_password)
      errors.add(:first_name, 'password empty')
    elsif (@raw_password.length < 6)
      errors.add(:first_name, 'must be at least 6 chars long')
    end
  end
end
