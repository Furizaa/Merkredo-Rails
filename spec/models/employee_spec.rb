require 'spec_helper'

describe Employee do

  it { should belong_to :company }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it 'can be instantiated from params' do
    params = { first_name: 'John', last_name: 'Doe', email: 'john@doe.com' }
    employee = Employee.new_from_params(params)
    employee.first_name.should eq params[:first_name]
    employee.last_name.should eq params[:last_name]
    employee.email.should eq params[:email]
  end

end
