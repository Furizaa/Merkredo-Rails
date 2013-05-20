class Employee < ActiveRecord::Base
  attr_accessible :active, :email, :first_name, :last_name

  validates :email, email: true
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validate :validate_name

  belongs_to :company

  private

  def validate_name
    validator = RealNameValidator.new(errors, first_name, last_name)
    validator.validate
  end
end
