class SearchController < ApplicationController
  def create
  	@listings = []

  	Listing.all.map(&:floorplans).flatten.each do |floorplan|
			if floorplan.num_bedrooms == params[:num_bedrooms].to_i && floorplan.num_bathrooms == params[:num_bathrooms].to_i
				@listings << floorplan.listing
			end
  	end

    @listings = @listings.uniq

  	render 'listings/index'
  end
end
