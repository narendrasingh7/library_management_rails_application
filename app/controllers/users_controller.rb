class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]
    before_action :authenticate_user!

    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to @user
      else 
        render :new, status: :unprocessable_entity
      end
    end

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


    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_no, :address, :avatar)
    end

    private
      def set_user
        @user = User.find(params[:id])
      end
end
