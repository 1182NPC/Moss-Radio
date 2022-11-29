class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :create, :update, :destroy]

  def show
    set_resident
  end

  def create
    @resident = set_resident
    @resident.save
    redirect_to resident_path(@resident)
  end

  def update
    @resident = set_resident
    @resident.update(resident_params)
  end

  def destroy
    @residet.destroy
    redirect_to resident_path(@resident)
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def set_radioset
    @radioset = Radioset.find(params[:id])
  end

  def resident_params
    params.require(:resident).permit(:bio, :links)
  end
end
