class ResidentsController < ApplicationController

  def new
    #TODO: MAKE ADMIN ONLY
    @resident = Resident.new
  end

  def show
    set_resident
    @radiosets = Radioset.where(resident: @resident)
  end

  def create
    #TODO: MAKE ADMIN ONLY
    @resident = Resident.new(resident_params)
    if @resident.save
      # WHICH PATH
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entitiy
    end
  end

  def edit
    set_resident
  end

  def update
    #TODO: MAKE ADMIN ONLY
    @resident = set_resident
    @resident.update(resident_params)
    redirect_to dashboard_path
  end

  def destroy
    #TODO: MAKE ADMIN ONLY
    set_resident
    @resident.radiosets.destroy_all
    @resident.destroy
    redirect_to dashboard_path
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def resident_params
    params.require(:resident).permit(:bio, :links, :name)
  end
end
