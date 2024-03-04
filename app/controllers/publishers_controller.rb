class PublishersController < ApplicationController

  before_action :set_publisher, only: %i[show edit update destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @publishers = Publisher.all
  end
  
  def show
  end
  
  def new
    @publisher = Publisher.new
  end
  
  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to @publisher
    else 
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update 
    if @publisher.update(publisher_params)
      redirect_to @publisher
    else 
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @publisher.destroy
    redirect_to root_path, status: :see_other
  end
  
  private
    def author_params
      params.require(:publisher).permit(:name)
    end

    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

end
