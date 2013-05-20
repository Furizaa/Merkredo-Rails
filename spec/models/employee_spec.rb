require 'spec_helper'

describe Employee do

  it { should belong_to :company }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

end
