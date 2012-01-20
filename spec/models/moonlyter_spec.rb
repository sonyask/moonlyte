require 'spec_helper'

describe Moonlyter do
  
  it "should only be created if already a user" do
    moonlyter = Factory.build(:moonlyter)
    moonlyter.save.should be_true
    
    moonlyter = Moonlyter.new(Factory.attributes_for(:moonlyter))
    moonlyter.save.should be_false
  end
  
  it "should not be created if profile info is nil" do
    moonlyter = Factory.build(:moonlyter, :description => "", :experience => "")
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