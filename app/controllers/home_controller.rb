class HomeController < ApplicationController
  def index
    if user_signed_in?
     
      # redirect_to :controller => 'users', :action => 'index#show'
      # render "users/show"
      redirect_to user_path(current_user)

    end  
    @books = Book.all
  end
end
