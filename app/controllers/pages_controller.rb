class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chatroom = Chatroom.first
    @message = Message.new
    @residents = Resident.all
    @radiosets = Radioset.all
  end

  def dashboard
    redirect_to root_path if current_user.admin == false

    @residents = Resident.all
    @posts = Post.all
    @radiosets = Radioset.all

  end
end
