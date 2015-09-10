class MessagesController < ApplicationController
  	def new
		@message = Message.new
		render :new
	end

	def show
		@message = Message.find(params[:id])
		@user = User.find_by({:email => @message.to})
	end

	def index
		@messages = Message.all
	end

	def create
		@message = Message.new(message_params)
			@message.from = current_user.email
		
		if @message.save
			current_user.messages << @message
			reciever = User.find_by_email(@message.to)
			reciever.messages << @message						
			
        redirect_to user_messages_path(current_user)
		else 
		  render 'new'
		end
	end

	
	def destroy	
		# @user = User.find_by(params[:id]
		@message = Message.find(params[:id])
	    @message.destroy
	    redirect_to user_messages_path(current_user)
	end

	private
	def message_params
		params.require(:message).permit(:to, :title, :body, :from)
	end
end
