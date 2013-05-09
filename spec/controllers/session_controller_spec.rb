require 'spec_helper'

describe SessionController do

  let(:account) { Fabricate(:account) }

  describe '.create' do

    it 'raises an error if login isn\'t present' do
      expect { xhr :post, :create }.to raise_error(Merkredo::InvalidParameters)
    end

    it 'will return error with invalid password' do
      xhr :post, :create, email: account.email, password: 'failure'
      ::JSON.parse(response.body)['error'].should be_present
    end

    it 'will return error with unknown mail' do
      xhr :post, :create, email: 'not.found@merkredo.com', password: 'developer'
      ::JSON.parse(response.body)['error'].should be_present
    end

    context 'success' do

      before do
        xhr :post, :create, email: account.email, password: 'nyancat'
        account.reload
      end

      it 'does not show a error' do
        ::JSON.parse(response.body)['error'].should_not be_present
      end

      it 'sets a session id' do
        session[:current_account_id].should eq(account.id)
      end

      it 'gives the account an auth_token' do
        cookies[:_t].should == account.auth_token
      end

      it 'returns the account object' do
        ::JSON.parse(response.body)['account']['email'].should eq(account.email)
      end

    end

  end

end