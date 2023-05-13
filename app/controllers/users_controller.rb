class UsersController < ApplicationController

  def search
    @user = User.find(params[:user_id])
    @books = @user.books 
    if params[:created_at] == ""
      @search_book = "日付を選択してください"
    else
      create_at = params[:created_at]
      @search_book = @books.where(['created_at LIKE ? ', "#{create_at}%"]).count
    end
  end


  def index
    @users = User.all
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @this_week_book_counts = []
    6.downto(0) do |n|
      @this_week_book_counts.push(@books.where(created_at: n.day.ago.all_day).count)
    end
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end



end
