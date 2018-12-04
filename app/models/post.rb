class Post < ApplicationRecord
  belongs_to :member
  acts_as_commentable
  
  validates :title, presence: true
end
