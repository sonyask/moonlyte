require 'spec_helper'

describe User do
  
  it "can only save with username password email" do
    user = User.new
    user.username = "a"*5
    user.save.should be_false
    user.email = "sample@example.com"
    user.save.should be_false
    6.times do |i|
      user.password = "a"*(i+1)
      user.save.should be_false
    end
    user.password = "a"*7
    user.save.should be_true
  end

  it "should have no duplicate usernames" do
    user1 = Factory.build(:user, :username => "duplicate")
    user1.save.should be_true
    user2 = Factory.build(:user, :username => "duplicate")
    user2.save.should be_false
  end
  
  it "should authenticate with matching username and password" do
    user = Factory.build(:user)
    user.authenticate("bobcats").should be_false
    user.authenticate(user.password).should be_true
  end
  
  it "should reject non-matching password confirmation" do
    user = Factory.build(:user, :password_confirmation => "incorrect")
    user.save.should be_false
    user.password_confirmation = user.password
    user.save.should be_true
  end
    
    
end