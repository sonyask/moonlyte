class Specialty < ActiveRecord::Base
  belongs_to :moonlyter
  has_many :tags
  has_many :ratings
  has_many :comments
end
