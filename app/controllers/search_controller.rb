class SearchController < ApplicationController
  def create
  	@listings = []

  	Listing.all.each do |listing|
  		listing.floorplans.each do |floorplan|
  			if floorplan.num_bedrooms == params[:num_bedrooms].to_i && floorplan.num_bathrooms == params[:num_bathrooms].to_i
  				@listings << listing
  			end
  		end
  	end



  	render 'listings/index'
  end
end
