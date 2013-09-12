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

  
  def before_save
    self.make_slug
    self.geocode = "30.386104,-91.166805" # Stubbed
  end

  private
    def make_slug
      #strip the string
      self.slug = self.slug.strip

      #blow away apostrophes
      self.slug.gsub! /['`]/,""

      # @ --> at, and & --> and
      self.slug.gsub! /\s*@\s*/, " at "
      self.slug.gsub! /\s*&\s*/, " and "

      #replace all non alphanumeric, underscore or periods with dash
      self.slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'  

      #convert double dashes to single
      self.slug.gsub! /-+/,"-"

      #strip off leading/trailing dash
      self.slug.gsub! /\A[-\.]+|[-\.]+\z/,""

      self.slug
    end
end