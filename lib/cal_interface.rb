class CalInterface

  require 'icalendar'

  attr_reader :icals

  def initialize(stream)
    parser = Icalendar::Parser.new(stream, false)
    @icals = parser.parse
  end

  def events
    return @events if @events
    @events = []
    @icals.first.events.each do |e|
      @events << Event.new_from_ical_event(e)
    end
    @events
  end

end
