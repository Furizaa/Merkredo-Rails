require 'current_account'

module ApplicationHelper
  include CurrentAccount

  def session?
    current_account.present?
  end
end
