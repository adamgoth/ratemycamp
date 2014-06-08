class Review < ActiveRecord::Base
	belongs_to :campsite
	belongs_to :user

	validates :user_id, :presence => true
	validates :campsite_id, :presence => true
	validates :rating, :presence => true
	validates :comments, :presence => true
end
