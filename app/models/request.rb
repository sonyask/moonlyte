class Request < ActiveRecord::Base

  belongs_to :user
  has_many :tags, :as => :tagable

  validates :description, :title, :presence => true

end
