require 'spec_helper'

describe Event do

  it { should have_many :attendees }
  it { should have_many :ratings }
  it { should belong_to :account }

  it { should_not validate_presence_of :name }
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

  describe 'ical binding' do

    let (:ical_event) { Fabricate.build(:ical_event) }
    let (:ical_timezone) { Fabricate.build(:ical_timezone) }

    it 'creates new event from ical data' do
      event = Event.new_from_ical_event(ical_event, ical_timezone)
      event.should be_kind_of Event
    end

    describe 'ical created event' do

      let (:event) { Event.new_from_ical_event(ical_event, ical_timezone) }

      it 'date_time' do
        event.date.to_date.to_s.should eq '2015-07-29'
      end
      it 'uid' do
        event.uid.should eq '#12345'
      end
      it 'should have timezone fixed' do
        event.date.strftime('%H').should eq '07'
        event.date.utc?.should be_true
      end

    end

  end

end
