class UsersController < ApplicationController
  def index
    @users = User.all
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to current_user
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to @user, notice: 'You have updated user successfully.'
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
   
  
end
