class Idea < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_one_attached :photo

  validates :title, presence: true
  validates :problem, presence: true
  validates :solution, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
