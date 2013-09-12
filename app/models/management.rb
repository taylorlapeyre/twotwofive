class Management < ActiveRecord::Base
	belongs_to :landlord
	belongs_to :listing

	validates :landlord_id, :listing_id, presence: true
end
