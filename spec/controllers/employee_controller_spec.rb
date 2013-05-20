require 'spec_helper'

describe EmployeeController do

  [:get, :post, :put].each do |method|
    context method do
      it 'requires a valid session' do
        expect { xhr method, :create }.to raise_error(Merkredo::NotLoggedIn)
      end
    end
  end

  context 'logged in' do

    let!(:account) { log_in }

    describe 'post' do

      it 'raises an error if parameters are not present' do
        expect { xhr :post, :create }.to raise_error(Merkredo::InvalidParameters)
      end

      context 'success' do

        before do
          xhr :post, :create, email: 'john.doe@merkredo.com', first_name: 'John', last_name: 'Doe'
        end

        it 'does not show an error' do
          ::JSON.parse(response.body)['message'].should_not be_present
        end

        it 'does show a success flag' do
          ::JSON.parse(response.body)['success'].should be_true
        end

      end

    end

    describe 'put' do
      let(:employee) { Fabricate(:employee) }

      context 'success' do

        before do
          put :update, id: employee.id, first_name: 'NewName'
          employee.reload
        end

        it 'updates the employee' do
          employee.first_name.should eq 'NewName'
        end

        it 'returns a success' do
          ::JSON.parse(response.body)['success'].should be_true
        end

      end
    end

    describe 'get' do
      let(:data) {
        xhr :get, :index
        ::JSON.parse(response.body)
      }

      it 'fetches a list of employees' do
        data['success'].should be_true
        data['employees'].count.should have_at_least(5).items
      end

      it 'employees are all from the logged in company' do
        data['employees'].each do |e|
          e.company_id.should eq 8
        end
      end
    end

  end

end
