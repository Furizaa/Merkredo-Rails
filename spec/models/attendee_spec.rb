require 'spec_helper'

describe Attendee do

  it { should belong_to :event }
  it { should have_many :ratings }

  it { should validate_presence_of :email }
  it { should validate_presence_of :token }

  it 'generates a new token on instantiation' do
    attendee = Attendee.new
    attendee.token.length.should be 64
  end

  describe 'token' do
    it 'is a hexadecimal string' do
      attendee = Attendee.new
      attendee.token.should =~ /[a-fA-F0-9]/
    end
  end

end
