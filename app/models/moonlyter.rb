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
  accepts_nested_attributes_for :specialties, 
                                :reject_if => lambda { |attr| attr[:description].blank? }, 
                                :allow_destroy => :true
  
  validates :user_id, :description, :experience, :presence => true
end