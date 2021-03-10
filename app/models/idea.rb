class Idea < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :problem, presence: true
  validates :solution, presence: true
  validates :address, presence: true
  # validate :allow_vote

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :most_popular, -> { left_joins(:votes).group(:id).order("COUNT(votes.id) DESC").limit(5) }

  scope :by_votes, -> (direction) { left_joins(:votes).group(:id).order("COUNT(votes.id) #{direction.upcase}") }

  scope :by_status, -> (status) { where(status: status) }

  def pre_vote_find(current_user)
    self.votes.find { |vote| vote.user_id == current_user.id }
  end

  def set_status
    if (self.votes.count >= self.goal) && (self.municipality == true)
      self.status = "Pending"
    end
    self.save
  end

  # def allow_vote
  #   if self.votes.count > self.goal
  #     errors.add(:votes, "The limit is reached")
  #   end
  # end

  def has_feedback?
    votes_with_comment = votes.where.not(comment: nil)
    votes_with_comment.length > 0
  end
end
