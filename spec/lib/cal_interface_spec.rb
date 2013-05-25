require 'spec_helper'
require 'cal_interface'

describe CalInterface do

  formats = {
      single: File.open(File.dirname(__FILE__) + '/../files/single_event.ics')
  }

  formats.each do |format, stream|
    context 'Format: ' + format.to_s do

      let(:cal) { CalInterface.new(stream) }

      it 'successfully parse file' do
        cal.icals.should be_kind_of Array
        cal.icals.length.should eq 1
      end

    end
  end

end
