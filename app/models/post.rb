class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  
  belongs_to :member
  acts_as_commentable

  default_scope { where(visible: true) }
   
  validates :title, presence: true
end
