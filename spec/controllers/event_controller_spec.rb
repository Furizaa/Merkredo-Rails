require 'spec_helper'

describe EventController do

  it 'raises an error without a session' do
    expect { xhr :get, :index }.to raise_error Merkredo::NotLoggedIn
  end

  context 'with valid session' do

    let! (:account) { log_in }

    context 'index' do

      let! (:event) { Fabricate(:event) }

      let (:get_data) do
        xhr :get, :index
        ::JSON.parse(response.body)
      end

      it 'returns a list of events' do
        get_data['success'].should be_true
        get_data['events'].length.should eq 1
      end

    end

  end

end
