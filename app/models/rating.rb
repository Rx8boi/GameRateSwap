class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :difficulty, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

  validates :game_id, uniqueness: {scope: :user, message: "- You have rated this game already. Please edit rating to reflect current playthrough"}

end
