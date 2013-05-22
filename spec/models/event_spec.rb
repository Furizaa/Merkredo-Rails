require 'spec_helper'

describe Event do

  it { should have_many :attendees }
  it { should have_many :ratings }
  it { should belong_to :account }

  it { should validate_presence_of :name }
  it { should validate_presence_of :date }
  it { should validate_presence_of :date_orig }
  it { should validate_presence_of :timezone }
  it { should validate_presence_of :token }
  it { should validate_presence_of :uid }

  it 'generates a new token on instantiation' do
    event = Event.new
    event.token.length.should be 64
  end

  describe 'token' do
    it 'is a hexadecimal string' do
      event = Event.new
      event.token.should =~ /[a-fA-F0-9]/
    end
  end

  describe 'name' do

    let (:event) { Fabricate.build(:event) }

    it 'will be sanitized before save' do
      event.name = '&some@crazy$stuff going on '
      event.save!
      event.name.should eq 'some_crazy_stuff going on'
    end

    it 'will automatically be trimmed to size' do
      event.name = 'This is some crazy event name that is clearly to long for the app and every sane person.'
      event.save!
      event.name.should eq 'This is some crazy event name that is clearly to long for the ap'
    end
  end

end
