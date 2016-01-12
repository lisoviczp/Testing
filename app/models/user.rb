class User < ActiveRecord::Base

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	has_many :pieces
	has_many :messages

	has_many :favorite_establishments
	has_many :favorites, through: :favorite_establishments, source: :establishment

end
