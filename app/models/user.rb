class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/


	has_many :groups 
	has_many :orgs, :through => :groups

	validates :given_name, :family_name, :email, presence:true
	validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive:true }
	validates :password, length: { in: 6..12 }
end
