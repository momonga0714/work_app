class ResidentsController < ApplicationController

  before_action :set_resident, only:[:edit,:show,:update,:destroy]

  def index
    @residents = Resident.all
  end

  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.create(resident_params)
    redirect_to "/"
  end

  def show
    

    
  end
  
  def edit
    
  end

  def update
    
    if  @resident.update(resident_params)
        redirect_to "/"
    else
        render :edit
    end

  end

  def destroy
    @resident.destroy
    redirect_to "/residents"
  end
  

  private
  def resident_params
    params.require(:resident).permit(:name,:income,:rent_y,:rent_m,:rent_d,:move_y,:move_m,:move_d,:post_id)
  end

  def set_resident
    @resident = Resident.find(params[:id])
  end
end
