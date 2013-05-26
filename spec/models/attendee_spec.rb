require 'spec_helper'

describe Attendee do

  it { should have_many :events }
  it { should have_many :ratings }
  it { should validate_presence_of :email }

end
