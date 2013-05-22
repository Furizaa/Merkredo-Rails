require 'spec_helper'

describe Event do

  it { should have_many :attendees }
  it { should have_many :ratings }
  it { should belong_to :account }

end
