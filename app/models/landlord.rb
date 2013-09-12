class Landlord < ActiveRecord::Base
	has_many :listings, through: :management
end
