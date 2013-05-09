require_dependency 'pbkdf2'

class Account < ActiveRecord::Base
  attr_accessible :email, :gender, :password

  belongs_to :company

  validates_presence_of :company_id
  validates_presence_of :email
  validates :email, email: true
  validate :validate_real_name
  validate :validate_password, changed: true
  validates_uniqueness_of :email

  before_save :ensure_password_is_hashed

  PASSWORD_MIN_LENGTH = 6

  def password=(password)
    @raw_password = password unless password.blank?
  end

  # To satisfy shouldas pretty error printing
  def password
    read_attribute(:password)
  end

  def email=(email)
    write_attribute(:email, email.downcase) if email
  end

  def confirm_password?(password)
    return false unless password_hash && salt
    self.password_hash == hash_password(password, salt)
  end

  def password_required!
    @password_required = true
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
      errors.add(:first_name, I18n.t(:'account.first_name.characters'))
    end
    if last_name =~ test
      errors.add(:last_name, I18n.t(:'account.last_name.characters'))
    end
  end

  def validate_password
    if (@raw_password && @raw_password.length < 6) || (@password_required && !@raw_password)
      errors.add(:password, I18n.t(:'account.password.short'))
    end
  end
end
