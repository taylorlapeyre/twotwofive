class Listing < ActiveRecord::Base
	has_many :floorplans
	has_many :management
	has_many :landlords, through: :management
	belongs_to :neighborhood
	has_one :amenity_list

	VALID_GEOCODE_REGEX = /-?\d{1,2}\.\d+,-?\d{1,2}\.\d+/
  VALID_PHONE_NUMBER_REGEX = /\d{10}/

	validates :address, :zip, :phone_number, :featured, :slug, :geocode, :active, presence: true
	validates :slug, uniqueness: true
	validates :geocode, format: { with: VALID_GEOCODE_REGEX }
	validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
end