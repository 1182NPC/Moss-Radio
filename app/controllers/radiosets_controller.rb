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
    # TODO: MAKE ADMIN ONLYyy
    @resident = Resident.find(params[:resdient_id])
    @radioset = set_radioset
    if @radioset.save
      # THIS NEEDS TO REDIRECT BACK TO DASHBOARD?
      redirect_to edit_radioset_path(@radioset), notice: "Radioset was successfully created"
    else
      # WHAT IS BEING RENDERED HERE?
      render :new, status: :unprocessable_entitiy
    end
  end

  # def unknown_create
  #   @resident = Resident.new(set_radioset)
  #   @resident.save
  #   @radioset.resident = @resident
  # end

  def edit
    set_radioset
  end

  def update
    # TODO: MAKE ADMIN ONLY
    # TODO: FIX THIS SO THAT THE RADIOSET CAN BE UPDATED
    @radioset = set_radioset
    @resident = Resident.find(params[:resdient_id])
    if @radioset.update(radioset_params)
      redirect_to @radioset, notice: "Radioset was successfully updated"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # TODO: MAKE ADMIN ONLY - DONE
    @radioset = set_radioset
    @radioset.destroy
    redirect_to dashboard_path, notice: "Radioset was sucessfully destroyed"
  end

  private

  def set_radioset
    @radioset = Radioset.find(params[:id])
  end

  def radioset_params
    params.require(:radioset).permit(:date, :audio_link, :date)
  end
end
