class ResidentsController < ApplicationController

  def new
    #TODO: MAKE ADMIN ONLY
    @resdient = Resident.new
  end

  def show
    set_resident
  end

  def create
    #TODO: MAKE ADMIN ONLY
    @resident = Resident.new(resident_params)
    if @resident.save
      redirect_to resident_path(@resident)
    else
      render :new, status: :unprocessable_entitiy
    end
  end

  def update
    #TODO: MAKE ADMIN ONLY
    @resident = set_resident
    @resident.update(resident_params)
  end

  def destroy
    #TODO: MAKE ADMIN ONLY
    @residet.destroy
    redirect_to resident_path(@resident)
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def resident_params
    params.require(:resident).permit(:bio, :links)
  end
end
