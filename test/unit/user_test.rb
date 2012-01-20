require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def attr
    @attr = {
        :name => "Example User",
        :email => "user@example.com",
        :password => "foobar",
        :password_confirmation => "foobar"
      }
  end
    
  test "can only save with username password email" do
    user = User.new
    user.username = "a"*5
    assert !user.save
    user.email = "sample@example.com"
    assert !user.save
    6.times do |i|
      user.password = "a"*(i+1)
      assert !user.save
    end
    user.password = "1"*7
    assert user.save
  end
  
  test "no duplicate usernames" do
    user1 = User.new(self.attr)
    user1.save
    user2 = User.new(self.attr)
    assert !user2.save
  end
  
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  firstName  :string(255)
#  lastName   :string(255)
#  email      :string(255)
#  password_digest   :string(255)
#  avatar     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

