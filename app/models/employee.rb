class Employee < ActiveRecord::Base
  attr_accessible :active, :email, :first_name, :last_name

  validates :email, email: true
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validate :validate_name

  belongs_to :company

  def self.new_from_params(params)
    employee = Employee.new
    employee.first_name = params[:first_name]
    employee.last_name = params[:last_name]
    employee.email = params[:email]
    employee
  end

  private

  def validate_name
    validator = RealNameValidator.new(errors, first_name, last_name)
    validator.validate
  end
end
