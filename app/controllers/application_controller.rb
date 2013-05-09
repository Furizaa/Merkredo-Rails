require 'current_account'
require_dependency 'merkredo'

class ApplicationController < ActionController::Base
  include CurrentAccount

  protect_from_forgery

  def index
  end

  private

  def requires_parameters(*required)
    required.each do |p|
      raise Merkredo::InvalidParameters.new(p) unless params.has_key?(p)
    end
  end
end
