class Floorplan < ActiveRecord::Base
	belongs_to :listing
	has_one :feature_list
end
