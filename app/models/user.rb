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
  has_many :requests, :dependent => :destroy

  attr_accessible :firstName, :lastName, :email, :username, :avatar, :password, :password_confirmation
  attr_reader :firstName
  
  validates :username,  :presence   => true,
                        :uniqueness => true
  
  validates :email,     :presence   => true, 
                        :uniqueness => true
                        
  validates :firstName, :length => { :maximum => 20 }
  validates :lastName,  :length => { :maximum => 20 }
  
  validates :password,  :presence => true,
                        :length => { :within => 7..40 }
                        
  validates :password_confirmation, :presence => true
                        
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create } 

end
