class BorrowingsController < ApplicationController

  before_action :set_borrowing, only: %i[show edit update destroy]

  def index
    @borrowings = Borrowing.all
  end
  
  def show
  end
  
  def new
    @borrowing = Borrowing.new
  end
  
  def create
    @borrowing = Borrowing.new(borrowing_params)
    if @borrowing.save
      redirect_to @borrowing
    else 
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update 
    if @borrowing.update(borrowing_params)
      redirect_to @borrowing
    else 
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @borrowing.destroy
    redirect_to root_path, status: :see_other
  end
  
  private
    def borrowing_params
      params.require(:author).permit(:name)
    end

    def set_borrowing
      @borrowing = Borrowing.find(params[:id])
    end
end
