require 'spec_helper'


describe Account do

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email}

  describe '#email' do

    let(:account) { Fabricate.build(:account) }

    %w(dot.fine@gmail.com mail@example.museum).each do |finemail|
      it { should allow_value(finemail).for(:email) }
    end

    %w(@gmail.com mail@ gmail.com).each do |badmail|
      it { should_not allow_value(badmail).for(:email) }
    end

    it 'is always used downcased' do
      account.email = 'DeVeLoPeR@Merkredo.Org'
      account.email.should eq 'developer@merkredo.org'
    end
  end

  describe '#password' do

    let(:account)  { Fabricate.build(:account) }

    before { account.password_required! }

    it 'is valid after initial save' do
      account.password = 'nyancat'
      account.save!
      account.confirm_password?('nyancat').should be_true
    end

    it 'is hashed after initial save' do
      account.password = 'roger1'
      account.save!
      account.password_hash.length.should eq 64
    end

    it 'needs more than 5 characters' do
      account.password = '12345'
      account.should_not be_valid
    end

  end

  context 'account creation' do
    let(:account) { Fabricate.build(:account) }

    it 'can be instantiated from params' do
      params = { email: 'developer@merkredo.com', password: 'secret' }
      account = Account.new_from_params(params)
      account.email.should eq(params[:email])
    end
  end

end
