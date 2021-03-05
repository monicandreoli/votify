class Idea < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :problem, presence: true
  validates :solution, presence: true
  validates :address, presence: true
  validates :goal, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :most_popular, -> { left_joins(:votes).group(:id).order("COUNT(votes.id) DESC").limit(5) }

  def pre_vote_find(current_user)
    self.votes.find { |vote| vote.user_id == current_user.id }
  end
end
