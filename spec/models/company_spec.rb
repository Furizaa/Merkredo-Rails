require 'spec_helper'

describe Company do

  it { should have_many :accounts }
  it { should have_many :employees }
  it { should validate_presence_of :name }
  it { should validate_presence_of :plan }

  describe '#name' do

    context 'has to be between 3 and 30 characters long' do
      it { should_not allow_value('ab').for(:name) }
      it { should allow_value('abc').for(:name) }
      it { should_not allow_value('abcd-abcd-abcd-abcd-abcd-abcd-a').for(:name) }
    end

    %w(Acme%Corp Some<e>ntities @twitter #hash sa$$y e@mail.io).each do |bad_name|
      it { should_not allow_value(bad_name).for(:name) }
    end

    ['Acme Corp.', 'AT&T'].each do |good_name|
      it { should allow_value(good_name).for(:name) }
    end

  end

end
