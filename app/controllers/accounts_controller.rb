class AccountsController < ApplicationController
  def create
    account = Account.new_from_params(params)
    account.password_required!
    if account.save
      log_on_account(account)
      return render json: { success: true }
    end
    render json: {
        success: false,
        message: I18n.t('login.errors', errors: account.errors.full_messages.join("\n"))
    }
  rescue ActiveRecord::StatementInvalid
    render json: { success: false, message: I18n.t('login.something_already_taken') }
  end
end
