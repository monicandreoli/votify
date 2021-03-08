class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ideas
  has_many :votes
  has_many :voted_ideas, through: :votes, class_name: 'Idea', foreign_key: :idea_id, source: :idea
  # validates :role, inclusion: { in: %w(Resident Municipality) }
  has_one_attached :photo

end
