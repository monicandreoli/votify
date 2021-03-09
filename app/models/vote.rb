class Vote < ApplicationRecord
  belongs_to :idea
  belongs_to :user

  # validate :allow_vote

  # def allow_vote
  #   if idea.votes.count > idea.goal
  #     errors.add(:votes, "The limit is reached")
  #   end
  # end
end
