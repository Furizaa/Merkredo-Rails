require 'spec_helper'

describe AccountsController do

  describe '.create' do

    let(:account) { Fabricate.build(:account) }

    it 'is logged in afterwards' do
      xhr :post, :create, email: account.email, password: 'secret'
      session[:current_account_id].should be_present
    end

    it 'returns a positive feedback' do
      xhr :post, :create, email: account.email, password: 'secret'
      ::JSON.parse(response.body)['success'].should be_true
    end

  end

end
