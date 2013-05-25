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

end
