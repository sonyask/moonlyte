# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  firstName  :string(255)
#  lastName   :string(255)
#  email      :string(255)
#  password   :string(255)
#  avatar     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_one :moonlyter
  
  attr_accessible :firstName, :lastName, :email, :username, :avatar
  
  validates :username, :email, :password, :presence => true
  
  
end