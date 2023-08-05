class BooksController < ApplicationController

  before_action :set_book, only: %i[show edit update destroy]
  # before_action :authenticate_u!
  before_action :authenticate_user!, except: :show
  # load_and_authorize_resource
    
  def index
    @books = Book.all
  end
   
  def show
    # @user = User.find(params[:id ])
  end
  
  def new
    @book = Book.new
    @authors = Author.all
    @publishers = Publisher.all
  end
  
  def create
    @book = Book.new(book_params)
    # authorize! :create, @book
  
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
    
    @approved_books = current_user.borrowings.where(status:"approved")


  end
  
  
  private
    def book_params
      params.require(:book).permit(:title, :category, :published_date, :quantity, :rent, :author_id, :publisher_id, :cover)
    end

    def set_book
      @book = Book.find(params[:id])
    end

end
