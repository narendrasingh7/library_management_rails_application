class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]
    before_action :authenticate_user!

    def index
      @users = User.all

    end

    def show
    end

    # def new
    #   @user = User.new
    # end

    # def create
    #   @user = User.new(user_params)
    #   if @user.save
    #     UserMailer.with(user: @user).welcome_email.deliver_now
    #     redirect_to @user
    #   else 
    #     render :new, status: :unprocessable_entity
    #   end
    # end

    def edit
      @user = User.find(params[:id])
    end

    def update
      # @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else 
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      # @user =User.find(params[:id])
      @user.destroy
      redirect_to root_path, status: :see_other
    end


    # methods 

    def user_home
      @books = Book.all
    end

    def view_all_books
      render "books/index"
    end

    def borrow_book
      @book = Book.find(params[:book_id])
      if Book.available?(@book)
        if Book.isBorrovable?(@book,current_user)
          borrow = @book.borrowings.new(issue_date: Date.today, due_date: Date.today+15.days, user_id: current_user.id, book_id:@book.id)
          if borrow.save
            redirect_to my_books_path
            @book.quantity - 1
          end
        else 
          redirect_to user_home_user_path(current_user)
          flash[:notice] = "You Already Borrowed This Book!"
        end
      else
        redirect_to user_home_user_path(current_user)
        flash[:notice] = "Book! not available"
      end
    end


    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_no, :address, :avatar)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
