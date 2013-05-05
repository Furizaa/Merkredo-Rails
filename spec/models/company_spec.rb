require 'spec_helper'

describe Company do

  it { should validate_presence_of :name }
  it { should validate_presence_of :plan }

  describe 'name format' do

    it "should always be 3 chars or longer" do
      @company = Fabricate.build(:company)
      @company.name = 'aa'
      @company.save.should == false
    end

    it "should always be less then 31 chars" do
      @company = Fabricate.build(:company)
      @company.name = 'abcd-abcd-abcd-abcd-abcd-abcd-a'
      @company.save.should == false
    end

    ['Acme%Corp', 'Some<e>ntities', '@twitter', '#hash', 'sa$$y', 'e@mail.io'].each do |bad_name|
      it "should not allow '#{bad_name}'" do
        @company = Fabricate.build(:company)
        @company.name = bad_name
        @company.save.should == false
      end
    end

    ['Acme Corp.', 'AT&T'].each do |good_name|
      it "should allow '#{good_name}'" do
        @company = Fabricate.build(:company)
        @company.name = good_name
        @company.save.should == true
      end
    end

  end

end
