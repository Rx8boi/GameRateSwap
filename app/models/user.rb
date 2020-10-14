class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :ratings
	has_many :rated_games, through: :ratings, source: :game

	#but also user has created many games to the list
	has_many :games 
end
