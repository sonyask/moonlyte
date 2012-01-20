# == Schema Information
#
# Table name: tags
#
#  id           :integer         not null, primary key
#  specialty_id :integer
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Tag < ActiveRecord::Base

  belongs_to :taggable, :polymorphic => true
  
  validates :name, :presence => true
end

