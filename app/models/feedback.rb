class Feedback < ApplicationRecord
  belongs_to :member
  belongs_to :assignee, class_name: 'Member', foreign_key: :assignee_id
  validates :subject, presence: true
  enum status: {Open: 0, InProgress: 1, InAppropriate: 2, Duplicate: 3, Closed: 4}
  enum priority: {None: 0, VeryLow: 1, Low: 2, Medium: 3, High: 4, VeryHigh: 5}
end
