class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chatroom = Chatroom.find(1)
    @message = Message.new
    @residents = Resident.all
    @radiosets = Radioset.all
  end

  def admin_page
    @residents = Resident.all
    @radiosets = Radioset.all
  end
end
