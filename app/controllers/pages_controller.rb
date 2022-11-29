class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chatroom = Chatroom.first
    @message = Message.new
    @residents = Resident.all
    @radiosets = Radioset.all
  end

  def dashboard
    @residents = Resident.all
    @posts = Post.all
    @radiosets = Radioset.all
  end

end
