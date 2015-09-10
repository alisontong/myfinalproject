class User < ActiveRecord::Base

	belongs_to :city
	has_many :messages
	has_secure_password

	
    extend FriendlyId
	friendly_id :username, use: [:slugged, :finders]

    # acts_as_taggable
end
