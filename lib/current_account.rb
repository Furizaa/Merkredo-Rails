module CurrentAccount

  def self.lookup_from_auth_token(auth_token)
    if auth_token && auth_token.length == 32
      Account.where(auth_token: auth_token).first
    end
  end

  def log_on_account(account)
    session[:current_account_id] = account.id
    unless account.auth_token && account.auth_token.length == 32
      account.auth_token = SecureRandom.hex(16)
      account.save!
    end
    set_permanent_cookie!(account)
  end

  def set_permanent_cookie!(user)
    cookies.permanent[:_t] = { value: user.auth_token, httponly: true }
  end

  def current_user
    return @current_user if @current_user || @not_logged_in

    if session[:current_account_id].blank?
      # when session is empty check fpr cookie
      @current_user = CurrentAccount.lookup_from_auth_token(cookies[:_t])
      session[:current_account_id] = @current_user.id if @current_user
    else
      @current_user ||= Account.where(id: session[:current_account_id]).first

      # assume session is broken if cookie conflicts with session
      if @current_user && cookies[:_t] != @current_user.auth_token
        @current_user = nil
      end
    end

    @current_user
  end

end