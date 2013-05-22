require 'spec_helper'

describe Attendee do

  it { should belong_to :event }
  it { should have_many :ratings }

end
