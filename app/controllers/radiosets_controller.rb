class RadiosetsController < ApplicationController

  def new
    @radioset = Radioset.new
  end

  def index
    @radiosets = Radioset.all
  end

  def show

  end

  def create
    #TODO: MAKE ADMIN ONLY
    @resident = Resident.find(params[:resdient_id])
    @radioset = Radioset.new(radioset_params)
    @radioset.resident = @resident
    if @radioset.save
      # THIS NEEDS TO REDIRECT BACK TO DASHBOARD?
      redirect_to radioset_path(@radioset)
    else
      # WHAT IS BEING RENDERED HERE?
      render "", status: :unprocessable_entitiy
    end
  end

  def unknown_create
    @resident = Resident.new(set_radioset)
    @resident.save
    @radioset.resident = @resident
  end

  

  def update
    #TODO: MAKE ADMIN ONLY
    @radioset = set_radioset
    @radioset.update(radioset_params)
  end

  def destroy
    #TODO: MAKE ADMIN ONLY

  end

  private

  def set_radioset
    @radioset = Radioset.find(params[:id])
  end

  def radioset_params
    params.require(:radioset).permit(:date, :audio_link, :date)
  end
end
