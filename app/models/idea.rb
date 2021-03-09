class Idea < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :problem, presence: true
  validates :solution, presence: true
  validates :address, presence: true
  validate :allow_vote

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :most_popular, -> { left_joins(:votes).group(:id).order("COUNT(votes.id) DESC").limit(5) }

  scope :by_votes, -> (direction) { left_joins(:votes).group(:id).order("COUNT(votes.id) #{direction.upcase}") }

  def pre_vote_find(current_user)
    self.votes.find { |vote| vote.user_id == current_user.id }
  end

  def allow_vote
    if self.votes.count > self.goal
      errors.add(:votes, "The limit is reached")
    end
  end
end
