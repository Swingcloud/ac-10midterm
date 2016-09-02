class EmergenciesController < ApplicationController

	def index	
		@emergencies = Emergency.all
		@emergency = Emergency.new
	end

	def new
		@emergendy = Emergency.new
	end

	def create
		@emergency= Emergency.new(er_params)
		@emergency.user = current_user
		if @emergency.save
			flash[:notice]="新增成功，等待救助！"
			redirect_to emergency_path(@emergency)
		else
			render :action => :new
		end
	end



	private

	def er_params
		params.require(:emergency).permit(:title, :content, :category_id)
	end 



end
