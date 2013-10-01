class Image < ActiveRecord::Base
	belongs_to :listing
	belongs_to :floorplan

	has_attached_file :image_file, :styles => { :small => "400x400", :medium => "600x600", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
