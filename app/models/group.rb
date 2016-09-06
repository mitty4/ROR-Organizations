class Group < ActiveRecord::Base
	belongs_to :user
	belongs_to :org
	validates :user_id, uniqueness: { scope: :org_id }
end
