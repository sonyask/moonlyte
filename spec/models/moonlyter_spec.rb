require 'spec_helper'

describe Moonlyter do
  
  before(:each) do
    @attr = {
        :description => "I teach guitar",
        :experience => "I have 10 years of experience",
    }
  end
  
  it "should only be created if already a user" do
    user = User.create!(:username => "sonya", :password => "1234567", :email => "whatever@whatever.com")
    moonlyter = user.build_moonlyter(@attr)
    moonlyter.save.should be_true
    
    moonlyter = Moonlyter.new(@attr)
    moonlyter.save.should be_false
  end
  
  it "should not be created if profile info is nil" do
    user = User.create!(:username => "sonya", :password => "1234567", :email => "whatever@whatever.com")
    moonlyter = user.build_moonlyter
    moonlyter.save.should be_false
  end
end
  
  
  
  #  id          :integer         not null, primary key
  #  description :text
  #  rating      :float
  #  education   :text
  #  experience  :text
  #  created_at  :datetime
  #  updated_at  :datetime
  #  user_id     :integer
#:description, :experience,