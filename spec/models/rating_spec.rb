require 'spec_helper'

describe Rating do

  it { should belong_to :attendee }
  it { should belong_to :event }
  it { should validate_presence_of :token }

  it 'generates a new token on instantiation' do
    rating = Rating.new
    rating.token.length.should be 64
  end

  describe 'token' do
    it 'is a hexadecimal string' do
      rating = Rating.new
      rating.token.should =~ /[a-fA-F0-9]/
    end
  end

end
