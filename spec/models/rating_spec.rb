require 'spec_helper'

describe Rating do

  it { should belong_to :attendee }
  it { should belong_to :event }

end
