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
  has_many :tags, :dependent => :destroy
  has_many :feedbacks, :dependent => :destroy
  
  validates :description, :rate, :presence => true
  
  
end
