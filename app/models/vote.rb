class Vote < ApplicationRecord
  belongs_to :member
  belongs_to :vote_option
end
