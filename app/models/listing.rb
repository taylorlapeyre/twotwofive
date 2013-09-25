class Listing < ActiveRecord::Base
  has_many :floorplans
  has_many :management
  has_many :landlords, through: :management
  belongs_to :neighborhood
  has_one :amenity_list

  VALID_GEOCODE_REGEX = /-?\d{1,2}\.\d+,-?\d{1,2}\.\d+/
  VALID_PHONE_NUMBER_REGEX = /\d{10}/
  VALID_ZIP_REGEX = /\d{5}/

  validates :address, :zip, :phone_number, :slug, :geocode, :active, presence: true
  validates :slug, uniqueness: true
  validates :geocode, format: { with: VALID_GEOCODE_REGEX }
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :zip, format: { with: VALID_ZIP_REGEX }

  
  before_validation(on: :create) do
    self.featured = false
    self.slug = make_slug
    puts self.slug
    puts '$'*50
    self.geocode = "30.386104,-91.166805" # Stubbed
  end

  before_destroy do
    Floorplan.destroy_all(:listing_id => self.id)
  end

  def make_slug
    slug = self.address
    #strip the string
    slug = slug.strip

    #blow away apostrophes
    slug.gsub! /['`]/,""

    # @ --> at, and & --> and
    slug.gsub! /\s*@\s*/, " at "
    slug.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with dash
    slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'  

    #convert double dashes to single
    slug.gsub! /-+/,"-"

    #strip off leading/trailing dash
    slug.gsub! /\A[-\.]+|[-\.]+\z/,""

    slug
  end
end