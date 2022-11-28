class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chatroom = Chatroom.find(1)
    @message = Message.new
  end
end
