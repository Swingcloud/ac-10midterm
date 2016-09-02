class EmergencyRepliesController < ApplicationController

	before_action :find_er_post
	before_action :which_replies , :only => [:edit, :destroy]

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



	def destroy
		@reply.destroy
		redirect_to emergency_path(@emergency)
	end






	private

	def find_er_post
		@emergency = Emergency.find(params[:emergency_id])
	end

	def params_permitted
		params.require(:reply).permit(:comment)
	end

	def which_replies
		@reply = Reply.find(params[:id])
	end

	
end
