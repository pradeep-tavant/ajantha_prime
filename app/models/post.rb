class Post < ApplicationRecord
  belongs_to :member
  acts_as_commentable

  default_scope { where(visible: true) }
   
  validates :title, presence: true
end
