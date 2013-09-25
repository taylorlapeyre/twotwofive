class LandlordsController < ApplicationController
  before_action :set_landlord, only: [:update, :destroy]

  def new
    @landlord = Landlord.new
  end

	def create
    @landlord = Landlord.new(landlord_params)

    if @landlord.save
      sign_in @landlord
      redirect_to '/'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /landlords/1
  # PATCH/PUT /landlords/1.json
  def update
    if @landlord.update(landlord_params)
      redirect_to @landlord, notice: 'landlord was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /landlords/1
  # DELETE /landlords/1.json
  def destroy
    @landlord.destroy
    redirect_to root
  end

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_landlord
      @landlord = Landlord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def landlord_params
      params.require(:landlord).permit(:email, :password, :company_name, :contact_phone, :first_name, :last_name)
    end
end
