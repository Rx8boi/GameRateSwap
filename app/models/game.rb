class Game < ApplicationRecord
	belongs_to :platform
	belongs_to :user
	has_many :ratings
	has_many :users, through: :ratings
	has_one_attached :image

	validates :title, presence: true
	validate :not_a_duplicate

	def self.alpha
		order(:title)
	end

	def platform_attributes=(attributes)
		self.platform = Platform.find_or_create_by(attributes) if !attributes['name'].empty?
		self.platform
	end

	def thumbnail
    self.image.variant(resize: "100x100")
  	end

  	def not_a_duplicate
    # if there is already a game with that title & platform, throw an error
    	game = Game.find_by(title: title, platform_id: platform_id)
    	if !!game && game != self
      		errors.add(:title, 'has already been added for that Platform')
    	end
  	end  	

end
