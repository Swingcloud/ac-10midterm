class EmergencyRepliesController < ApplicationController

	before_action :find_er_post

	def new
		@reply = Reply.new 
	end

	def create 
		@reply = @emergency.replies.build(params_permitted)
		@reply.user = current_user
		if @reply.save
			flash[:notice]= "新增成功"
			redirect_to emergency_path(@emergency)
		else
			render :action => :new
	end
	end





	private

	def find_er_post
		@emergency = Emergency.find(params[:emergency_id])
	end

	def params_permitted
		params.require(:reply).permit(:comment)
	end

	
end
