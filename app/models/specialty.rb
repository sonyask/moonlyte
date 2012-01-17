# == Schema Information
#
# Table name: specialties
#
#  id             :integer         not null, primary key
#  description    :text
#  rate           :float
#  created_at     :datetime
#  updated_at     :datetime
#  moonlyter_id   :integer
#  total_rating   :integer
#  average_rating :float
#  num_ratings    :integer
#

class Specialty < ActiveRecord::Base
  belongs_to :moonlyter
  has_many :tags
  has_many :feedbacks
  
  validates :description, :rate, :presence => true
  
  
end
