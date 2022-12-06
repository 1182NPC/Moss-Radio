class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(1)
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if !@message.content.empty? && @message.save
      ChatroomChannel.broadcast_to(@chatroom,
                                   render_to_string(partial: "shared/message", locals: { message: @message }))
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

