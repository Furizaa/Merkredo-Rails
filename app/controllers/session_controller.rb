class SessionController < ApplicationController

  def create
    requires_parameters(:email, :password)

    @account = Account.where(email: params[:email].downcase).first

    if @account.present? && @account.confirm_password?(params[:password])
      log_on_account(@account)
      return render json: @account
    end

    render json: { error: I18n.t('login.incorrect_username_or_password') }
  end

end
