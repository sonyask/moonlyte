# == Schema Information
#
# Table name: feedbacks
#
#  id           :integer         not null, primary key
#  comment      :text
#  rating       :integer
#  created_at   :datetime
#  updated_at   :datetime
#  specialty_id :integer
#  username     :string(255)
#

class Feedback < ActiveRecord::Base
  belongs_to :specialty
  
  validates :rating, :presence => true 
end
