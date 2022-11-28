class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :destroy]

  def show
    set_resident
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end
end
