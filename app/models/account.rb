require_dependency 'pbkdf2'

class Account < ActiveRecord::Base
  attr_accessible :email, :gender, :password

  belongs_to :company

  validates :email, email: true
  validates_presence_of :email
  validate :validate_real_name
  validate :validate_password
  validate :validate_real_name
  validates_uniqueness_of :email

  before_save :ensure_password_is_hashed
  before_create :create_company

  PASSWORD_MIN_LENGTH = 6

  def self.email_available?(email)
    lower = email.downcase
    Account.where(email: lower).blank?
  end

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

  def self.new_from_params(params)
    account = Account.new
    account.email = params[:email]
    account.password = params[:password]
    account
  end

  private

  def create_company
    company = Company.new name: 'Acme Inc.', plan: 0
    company.save!
    self.company_id = company.id
  end

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
    validator = RealNameValidator.new(errors, first_name, last_name)
    validator.validate
  end

  def validate_password
    if (@raw_password && @raw_password.length < PASSWORD_MIN_LENGTH) || (@password_required && !@raw_password)
      errors.add(:password, I18n.t(:'models.account.password.short', min: PASSWORD_MIN_LENGTH))
    end
  end
end
