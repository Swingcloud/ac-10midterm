class Emergency < ApplicationRecord
	validates_presence_of :title, :content
	belongs_to :user
	belngs_to :category
end
