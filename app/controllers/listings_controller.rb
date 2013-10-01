class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :signed_in, except: [:show, :index]
  before_action :correct_landlord, only: [:update, :edit, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all.where active: true
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @floorplan = Floorplan.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        Management.create(landlord_id: current_landlord.id, listing_id: @listing.id)
        @floorplan = Floorplan.new

        format.html { render new_floorplan_path }
        format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:building_name, :address, :zip, :descrption, :contact_email, :phone_number, :website_url, :neighborhood_id)
    end

    def signed_in
      redirect_to '/' unless signed_in?
    end

    def correct_landlord
      correct = false
      @listing = Listing.find(params[:id])

      @listing.landlords.each do |landlord|
        correct = true if landlord.id == current_landlord.id
      end
      
      redirect_to '/' unless correct
    end 
end
