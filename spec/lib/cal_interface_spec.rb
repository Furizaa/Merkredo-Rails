require 'spec_helper'
require 'cal_interface'

describe CalInterface do

  formats = {
      single: File.open(File.dirname(__FILE__) + '/../files/single_event.ics').read
  }

  formats.each do |format, stream|
    context 'Format: ' + format.to_s do

      let(:cal) { CalInterface.new(stream) }

      it 'successfully parse file' do
        cal.icals.should be_kind_of Array
        cal.icals.length.should eq 1
      end

      it 'builds event models' do
        cal.events.should be_kind_of Array
        cal.events.length.should eq 1
      end

      it 'converts date_time to utc' do
        cal.events.first.dtbegin.utc?.should be_true
        cal.events.first.dtend.utc?.should be_true
      end

      let(:attendee) { cal.attendees(cal.events.first.uid).first }

      it 'builds attendees' do
        attendee.email.should be_present
        attendee.email.should eq 'fry@planet-express.com'
      end

    end
  end

end
