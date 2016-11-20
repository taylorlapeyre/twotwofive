class Floorplan < ActiveRecord::Base
	belongs_to :listing
	has_one :feature_list
	has_many :images

	validates :name, :listing_id, :num_bathrooms, :num_bedrooms, :rent, :square_footage, :lease_term, :active, :desposit, presence: true

	def feature_list= hash
		hash.floorplan_id = id
		FeatureList.create(hash)
	end

end