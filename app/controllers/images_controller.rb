class ImagesController < ApplicationController
  before_action :signed_in
  before_action :correct_landlord
  def new
    @image = Image.new

    if params[:listing_id]
      @listing = Listing.find(params[:listing_id])
    elsif params[:floorplan_id]
      @floorplan = Floorplan.find(params[:floorplan_id])
    end
  end

  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.js
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:listing_id, :floorplan_id, :image_file)
    end
    
    def signed_in
      redirect_to '/' unless signed_in?
    end

    def correct_landlord
      @listing = Listing.find(params[:listing_id])
      redirect_to '/' if @listing.landlords.where(id: current_landlord.id).empty?
    end 

end
