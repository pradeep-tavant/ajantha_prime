class Feedback < ApplicationRecord
  belongs_to :member
  belongs_to :assignee, class_name: 'Member', foreign_key: :assignee_id
  validates :subject, presence: true
  enum status: ["Open", "InProgress", "InAppropriate", "Duplicate", "Closed"]
  enum priority: ["None", "VeryLow", "Low", "Medium", "High", "VeryHigh"]
end
