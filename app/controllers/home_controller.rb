class HomeController < ApplicationController
  def index
    @books = Book.all
    if user_signed_in?
      # redirect_to :controller => 'users', :action => 'index#show'
      # render "users/show"
      # redirect_to user_path(current_user)
      # redirect_to  user_home_user_path(current_user)
    
    end  
  end
end
# user_home