class FloorplansController < ApplicationController
  before_action :set_floorplan, only: [:update, :destroy]
  before_action :signed_in
  before_action :correct_landlord, only: [:new]

  def new
    @floorplan = Floorplan.new
    @listing = Listing.find(params[:listing_id])
  end

	def create
    @floorplan = Floorplan.new(floorplan_params)

    respond_to do |format|
      if @floorplan.save
        format.js
        format.json { render action: 'show', status: :created, location: @floorplan }
      else
        format.json { render json: @floorplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floorplans/1
  # PATCH/PUT /floorplans/1.json
  def update
    respond_to do |format|
      if @floorplan.update(floorplan_params)
        format.html { redirect_to @floorplan, notice: 'floorplan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @floorplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floorplans/1
  # DELETE /floorplans/1.json
  def destroy
    @floorplan.destroy
    respond_to do |format|
      format.html { redirect_to floorplans_url }
      format.json { head :no_content }
    end
  end

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_floorplan
      @floorplan = Floorplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def floorplan_params
      params.require(:floorplan).permit(:name, :listing_id, :num_bathrooms, :num_bedrooms, :rent, :rent_type, :square_footage, :deposit, :lease_term, :lease_type)
    end

    def signed_in
      redirect_to '/' unless signed_in?
    end

    def correct_landlord
      @listing = Listing.find(params[:listing_id])
      redirect_to '/' if @listing.landlords.where(id: current_landlord.id).empty?
    end 
end
