require 'spec_helper'

describe Event do

  it { should have_many :attendees }
  it { should have_many :ratings }
  it { should belong_to :account }

  it { should_not validate_presence_of :name }
  it { should validate_presence_of :dtbegin }
  it { should validate_presence_of :dtend }
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

    let (:ical_event) do
      RiCal.Calendar do
        event do
          description   'MA-6 First US Manned Spaceflight'
          dtstart       Time.zone.parse('2015-07-29T12:00:00+05:00')
          dtend         Time.zone.parse('2015-07-29T13:00:00+05:00')
          location      'Cape Canaveral'
          add_attendee  'john.glenn@nasa.gov'
          uid           '#12345'
        end
      end
    end

    it 'creates new event from ical data' do
      event = Event.new_from_ical_event(ical_event.events.first)
      event.should be_kind_of Event
    end

    describe 'ical created event' do

      let (:event) { Event.new_from_ical_event(ical_event.events.first) }

      it 'start date_time' do
        event.dtbegin.to_s.should eq '2015-07-29 07:00:00 UTC'
      end
      it 'end date_time' do
        event.dtend.to_s.should eq '2015-07-29 08:00:00 UTC'
      end
      it 'body' do
        event.body.should eq 'MA-6 First US Manned Spaceflight'
      end
      it 'uid' do
        event.uid.should eq '#12345'
      end

    end

  end

end
