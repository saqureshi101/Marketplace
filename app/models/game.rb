class Game < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, use: :slugged 

	belongs_to :user
	has_many :sales 

	has_attached_file :image 

	validates_numericality_of :price, 
		greather_then: 49, message: "Must be at least 50 cents"
	

		validates_attachment_content_type :image, 
		content_type:  /^image\/(png|gif|jpeg)/,
		message: "Only images allowed"

    validates :image, attachment_presence: true 
end
