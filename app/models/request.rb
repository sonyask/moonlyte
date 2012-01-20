class Request < ActiveRecord::Base

  belongs_to :user
  has_many :tags, :as => :taggable

  validates :description, :title, :presence => true

end
