class Artist < ActiveRecord::Base
	has_many :messages


	def artist_name
		artist.name
	end
end
