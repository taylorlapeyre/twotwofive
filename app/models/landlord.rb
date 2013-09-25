class Landlord < ActiveRecord::Base
  has_many :management
  has_many :listings, through: :management

  validates :email, :password, presence: true

  def Landlord.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Landlord.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Landlord.encrypt(Landlord.new_remember_token)
    end
end
