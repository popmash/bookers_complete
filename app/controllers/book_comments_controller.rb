class BookCommentsController < ApplicationController
  
  def create
  @book = Book.find(params[:book_id])
  @comments = BookComment.new(book_comments_params)
  @comments.user_id = current_user.id
  @comments.book_id = @book.id
  @comments.save
  redirect_to request.referer
  end
  
  def destroy
    @book_comment = BookComment.find(params[:book_id])
    @book_comment.destroy
    redirect_to request.referer
  end
  private 
  
  def book_comments_params
    params.require(:book_comment).permit(:user_id, :book_id, :comment)
  end
  
  
  
end
