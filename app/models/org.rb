class Org < ActiveRecord::Base
	has_many :groups
	has_many :users, :through => :groups 

	validates :name, :description, presence:true
	validates :name, length: { minimum: 5 }
	validates :description, length: { minimum: 10 }
end
