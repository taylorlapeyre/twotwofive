class Management < ActiveRecord::Base
	has_one :landlord
	has_one :listing
end
