class Idea < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_one_attached :photo

  validates :title, presence: true
  validates :problem, presence: true
  validates :solution, presence: true
  validates :address, presence: true
end
