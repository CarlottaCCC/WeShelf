class UsersController < ApplicationController

  def index 
    @users = User.all
    
    if params[:search]
    @search_term_user = params[:search]
    @users = @users.search_by(@search_term_user)
    end
  end


  def show
    @user = User.find(params[:id])
    @book = @user.books

  end


  private

  def user_params
    params.require(:user).permit(:id,:avatar)
  end

  
end
