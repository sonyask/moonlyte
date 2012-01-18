# == Schema Information
#
# Table name: moonlyters
#
#  id          :integer         not null, primary key
#  description :text
#  rating      :float
#  education   :text
#  experience  :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

class Moonlyter < ActiveRecord::Base
  belongs_to :user
  has_many :specialties, :dependent => :destroy
  
  validates :description, :experience, :presence => true
end