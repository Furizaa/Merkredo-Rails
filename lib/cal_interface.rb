class CalInterface

  require 'ri_cal'

  attr_reader :icals

  def initialize(string)
    @icals = RiCal.parse_string(string)
    @icals
  end

  def events
    return @events if @events
    @events = []
    @icals.first.events.each do |e|
      @events << Event.new_from_ical_event(e)
    end
    @events
  end

  def attendees(event_uid)
    return @attendees if @attendees
    @attendees = []
    cal_event = @icals.first.events.find { |e| e.uid == event_uid }
    cal_event.attendee.each do |a|
      @attendees << Attendee.new(email: a.gsub('MAILTO:', ''))
    end
    @attendees
  end

end
