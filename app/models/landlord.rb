class Landlord < ActiveRecord::Base
	has_many :management
	has_many :listings, through: :management

	validates :email, :password, presence: true
end
