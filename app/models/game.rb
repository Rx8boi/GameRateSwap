class Game < ApplicationRecord
	belongs_to :platform
	belongs_to :user
	has_many :ratings
	has_many :users, through: :ratings
	#has_one_attached :image
	accepts_nested_attributes_for :platform

	validates :title, presence: true
	validates :title, uniqueness: {scope: :platform_id, message: "You have added this game for this system already"}

	def new
		@game = Game.new
	end

	def title_and_platform
		"#{title} - #{platform.console}"
	end

  def platform_attributes=(attributes)
    self.platform = Platform.find_or_create_by(attributes) if !attributes['console'].empty?
    self.platform
  end

end
	#def not_duplicate
	#	if Game.find_by(title: title, platform_id: platform_id)
	#		errors.add(:title, "has already been added for that system")
	#	end
	#end
#game needs to be unique when added -> custom scope?

