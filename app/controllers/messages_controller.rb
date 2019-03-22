class MessagesController < ApplicationController
  def new
    @message = Message.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    # 2) Create a new message and save it to database
    # 3) redirect to /messages
    @message = Message.new(message_params)
    @message.save

        redirect_to messages_path

  end

  def index
    # 4) list all my messages, put it in @messages
    @messages = Message.where(from_user_id: current_user.id)
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy

    redirect_to messages_path
  end


private

  def message_params
    params.require(:message).permit(:from_user_id, :to_user_id, :context)
  end



end
