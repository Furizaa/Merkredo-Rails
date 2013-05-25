require 'icalendar'

Fabricator :ical_event, from: :'Icalendar::Event' do
  dtstart DateTime.new(2015, 7, 29, 12, 0, 0, '+0')
  dtend DateTime.new(2015, 7, 29, 13, 0, 0, '+0')
  uid '#12345'
end

Fabricator :ical_timezone, from: :'Icalendar::Timezone' do
  tzoffsetfrom '+0500'
  tzoffsetto '+0500'
end
