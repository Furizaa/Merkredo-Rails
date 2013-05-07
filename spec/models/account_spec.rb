require 'spec_helper'


describe Account do

  it { should belong_to :company }
  it { should validate_presence_of :email }
  it { should validate_presence_of :company_id }
  it { should_not validate_presence_of :first_name }
  it { should_not validate_presence_of :last_name }

  describe '#email' do
    %w(dot.fine@gmail.com mail@example.museum).each do |finemail|
      it { should allow_value(finemail).for(:email) }
    end

    %w(@gmail.com mail@ gmail.com).each do |badmail|
      it { should_not allow_value(badmail).for(:email) }
    end
  end

  describe '#name' do

    ['Andreas', 'Josè', "d'Arras", 'Luther King, Jr.', 'Sausage-Hausen'].each do |finename|
      it { should allow_value(finename).for(:first_name) }
      it { should allow_value(finename).for(:last_name) }
    end

    %w(Dave$ "john #hash @twitter §what the? hel*).each do |badname|
      it { should_not allow_value(badname).for(:first_name) }
      it { should_not allow_value(badname).for(:last_name) }
    end

  end

  describe '#password' do

    let(:account)  { Fabricate.build(:account) }

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

end
