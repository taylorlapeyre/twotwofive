class SessionsController < ApplicationController

	def new
	end

	def create
		landlord = Landlord.find_by(email: params[:session][:email].downcase, password: params[:session][:password])

		if landlord # && landlord.authenticate(params[:session][:password])
			sign_in landlord
      redirect_to '/'
		else
			flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
	end

	def destroy
		sign_out
    redirect_to root_url
	end
end