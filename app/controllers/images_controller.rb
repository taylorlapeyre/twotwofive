class ImagesController < ApplicationController
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
end
