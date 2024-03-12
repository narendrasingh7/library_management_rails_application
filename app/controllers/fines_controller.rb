class FinesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_fine, only: %i[show edit update destroy]

  def index
    @fines = Fine.all
  end
  
  def show
  end
  
  def new
    @fine = Fine.new
  end
  
  def create
    @fine = Fine.new(fine_params)
    if @fine.save
      redirect_to @fine, notice: 'User was successfully created.'
    else 
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update 
    if @fine.update(fine_params)
      redirect_to @fine
    else 
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @fine.destroy
    redirect_to root_path, status: :see_other
  end
  
  private
    def fine_params
      params.require(:fine).permit(:amount,:user_id,:borrowing_id)
    end

    def set_fine
      @author = Fine.find(params[:id])
    end
end
