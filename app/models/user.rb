 class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :github]

	has_many :ratings
	has_many :rated_games, through: :ratings, source: :game

	#but also user has created many games to the list
	has_many :games 

	def self.create_from_provider_data(provider_data)
		where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
			user.email = provider_data.info.email
			user.password =Devise.friendly_token[0, 20]
		end
	end
end
