class Listing < ActiveRecord::Base
	has_many :floorplans
	has_many :landlords, through: :management
	belongs_to :neighborhood
	has_one :amenity_list
end
