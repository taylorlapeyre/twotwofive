class Management < ActiveRecord::Base
	belongs_to :landlord
	belongs_to :listing
end
