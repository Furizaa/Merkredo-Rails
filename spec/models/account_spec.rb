require 'spec_helper'


describe Account do

  it { should belong_to :company }
  it { should validate_presence_of :email }
  it { should validate_presence_of :company_id }
  it { should_not validate_presence_of :first_name }
  it { should_not validate_presence_of :last_name }

  describe 'email validation' do
    ['dot.fine@gmail.com', 'mail@example.museum'].each do |finemail|
      it "should allow valid mail '#{finemail}'" do
        account = Fabricate.build(:account, email: finemail)
        account.should be_valid
      end
    end

    ['@gmail.com', 'mail@', 'gmail.com'].each do |badmail|
      it "should not allow invalid mail '#{badmail}'" do
        account = Fabricate.build(:account, email: badmail)
        account.should_not be_valid
      end
    end
  end


  describe 'name validation' do

    ['Andreas', 'Josè', "d'Arras", 'Luther King, Jr.', 'Sausage-Hausen'].each do |finename|
      it "should allow valid name '#{finename}'" do
        account = Fabricate.build(:account)
        account.first_name = finename
        account.last_name = finename
        account.should be_valid
      end
    end

    ['Dave$', '"john', '#hash', '@twitter', '§what', 'the?', 'hel*'].each do |badname|
      it "should not allow invalid name '#{badname}'" do
        account = Fabricate.build(:account)
        account.first_name = badname
        account.last_name = badname
        account.should_not be_valid
      end
    end

  end


  describe 'password' do

    before do
      @account = Fabricate.build(:account)
      @account.password = 'nyancat'
      @account.save!
    end

    it 'should have a valid password after initial save' do
      @account.confirm_password?('nyancat').should be_true
    end

    it 'should have a hashed password after initial save' do
      @account.password_hash.length.should eq 64
    end

  end

  describe 'password validation' do

    it 'should has more than 5 characters' do
      account = Fabricate.build(:account)
      account.password = '12345'
      account.should_not be_valid
    end

  end

end
