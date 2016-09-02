class EmergenciesController < ApplicationController
	before_action :er_post, :only => [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, :except => [:index]


	def index	
		@emergencies = Emergency.all
		@emergency = Emergency.new
	end

	def new
		@emergency = Emergency.new
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

	def show
		@replies = @emergency.replies
	end

	def destroy
		@emergency.destroy
		flash[:alert] = "刪除成功"
		redirect_to emergencies_path
	end



	private

	def er_params
		params.require(:emergency).permit(:title, :content, :category_id)
	end 

	def er_post
		@emergency = Emergency.find(params[:id])
	end


end
