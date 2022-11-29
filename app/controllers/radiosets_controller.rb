class RadiosetsController < ApplicationController

  def new
    #TODO: MAKE ADMIN ONLY
    @radioset = Radioset.new
  end

  def index

  end

  def show

  end

  def create
    #TODO: MAKE ADMIN ONLY
    @resident = Resident.new()
  end

  def update
    #TODO: MAKE ADMIN ONLY
  end

  def destroy
    #TODO: MAKE ADMIN ONLY
  end

  private

  def set_radioset
    @radioset = Radioset.find(params[:id])
  end
end
