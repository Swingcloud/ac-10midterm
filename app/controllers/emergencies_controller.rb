class EmergenciesController < ApplicationController

	def index	
		@emergencies = Emergency.all
		@emergency = Emergency.new
	end

end
