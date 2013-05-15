require 'current_account'
require_dependency 'merkredo'

class ApplicationController < ActionController::Base

  include CurrentAccount

  protect_from_forgery

  before_filter :preload_json

  def index
  end

  private

  def preload_json
    if request.format && request.format.html?
      if current_account.present?
        store_preload(
            'currentAccount',
            MultiJson.dump(CurrentAccountSerializer.new(current_account, root: false))
        )
      end
    end
  end

  def store_preload(key, json)
    @preload ||= {}
    @preload[key] = json.gsub('</', "<\\/")
  end

  def requires_parameters(*required)
    required.each do |p|
      raise Merkredo::InvalidParameters.new(p) unless params.has_key?(p)
    end
  end
end
