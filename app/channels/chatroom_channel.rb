class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.last
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
