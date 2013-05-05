class Company < ActiveRecord::Base

  attr_accessible :name, :plan

  has_many :accounts, dependent: :restrict

  validates :name, :plan, presence: true, allow_blank: false
  validate :companyname_validator

  def self.name_length
    3..30
  end

  def companyname_validator
    validator = CompanynameValidator.new(name)
    unless validator.valid_format?
      validator.errors.each do |e|
        errors.add(:name, e)
      end
    end
  end

end
