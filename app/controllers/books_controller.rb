class BooksController < ApplicationController

  before_action :set_book, only: %i[show edit update destroy]
  # before_action :authenticate_u!
    
  def index
    @books = Book.all
  end
   
  def show
    # @user = User.find(params[:id ])
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
  
    if @book.save
  
      redirect_to @book
    else 
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    # @user = User.find(params[:id])
  
  end
  
  def update
    # @user = User.find(params[:id])
  
    if @book.update(book_params)
      redirect_to @book
    else 
      render :new, status: :unprocessable_entity
    end
  
  end
  
  def destroy
    # @user =User.find(params[:id])
    @book.destroy
  
    redirect_to root_path, status: :see_other
  
  end


  def user_book
  end
  
  
  private
    def book_params
      params.require(:book).permit(:name)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
