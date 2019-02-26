class Poll < ApplicationRecord
  extend FriendlyId
  friendly_id :topic, use: [:slugged, :finders]

  has_many :vote_options, dependent: :destroy
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true

  validates :topic, :start_date, :end_date, :vote_options, presence: true

  def normalized_votes_for(option)
    votes_summary == 0 ? 0 : (option.votes.count.to_f / votes_summary) * 100
  end

  def votes_summary
    vote_options.inject(0) {|summary, option| summary + option.votes.count}
  end

end
