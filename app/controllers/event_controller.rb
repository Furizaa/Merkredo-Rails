class EventController < ApplicationController

  before_filter :ensure_logged_in

  def index
    events = Event.find_all_by_account_id(current_account.id)
    events ||= []
    render json: events, root: false
  end

end
