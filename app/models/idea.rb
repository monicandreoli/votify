class Idea < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :problem, presence: true
  validates :solution, presence: true
  validates :address, presence: true
end
