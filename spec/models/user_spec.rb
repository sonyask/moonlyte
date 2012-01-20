require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = {
        :username => "howard",
        :email => "user@example.com",
        :password => "1"*7,
      }
  end
  
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
    user.password = "1"*7
    user.save.should be_true
  end

  it "no duplicate usernames" do
    user1 = User.new(@attr)
    user1.save should be_true
    user2 = User.new(@attr)
    user2.save.should be_false
  end
end