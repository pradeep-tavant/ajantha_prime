class Feedback < ApplicationRecord
  belongs_to :member
  validates :subject, presence: true
  enum status: ["Open", "InProgress", "InAppropriate", "Duplicate", "Closed"]
  enum priority: ["None", "VeryLow", "Low", "Medium", "High", "VeryHigh"]
end
