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
  has_secure_password
  
  has_one :moonlyter, :dependent => :destroy
  
  attr_accessible :firstName, :lastName, :email, :username, :avatar, :password, :password_confirmation
  
  validates :username, :email, :password, :presence => true
  validates :username, :email, :uniqueness => true
end