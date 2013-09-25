module SessionsHelper
	def sign_in(landlord)
    remember_token = Landlord.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    landlord.update_attribute(:remember_token, Landlord.encrypt(remember_token))
    self.current_landlord = landlord
  end

  def current_landlord=(landlord)
    @current_landlord = landlord
  end

  def current_landlord
    remember_token = Landlord.encrypt(cookies[:remember_token])
    @current_landlord ||= Landlord.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_landlord.nil?
  end

  def sign_out
    self.current_landlord = nil
    cookies.delete(:remember_token)
  end
end
