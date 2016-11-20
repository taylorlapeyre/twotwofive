class FeatureList < ActiveRecord::Base
	belongs_to :floorplan

	def displayed_features
		attributes.select { |key, value| !['id', 'floorplan_id', 'created_at', 'updated_at'].include?(key) }
	end
end
