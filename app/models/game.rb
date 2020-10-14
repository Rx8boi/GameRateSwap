class Game < ApplicationRecord
	belongs_to :platform
	belongs_to :user
	has_many :ratings
	has_many :users, through: :ratings
	#has_one_attached :image
	accepts_nested_attributes_for :platform
	validates :title, presence: true
	#validate :not_a_duplicate

	def new
		@game = Game.new
	end

end
