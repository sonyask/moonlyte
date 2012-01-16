class Moonlyter < ActiveRecord::Base
  belongs_to :user
  has_many :specialties
end
