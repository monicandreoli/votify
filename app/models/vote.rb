class Vote < ApplicationRecord
  belongs_to :idea
  belongs_to :user

  after_create :check_idea_status

  def check_idea_status
    self.idea.set_status
  end
  # validate :allow_vote

  # def allow_vote
  #   if idea.votes.count > idea.goal
  #     errors.add(:votes, "The limit is reached")
  #   end
  # end
end
