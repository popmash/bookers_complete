class BookCommentsController < ApplicationController
  
  def create
  @book = Book.find(params[:book_id])
  @comment = BookComment.new(book_comments_params)
  @comment.user_id = current_user.id
  @comment.book_id = @book.id
  @comment.save
  
  end
  
  def destroy
    @comment = BookComment.find(params[:book_id])
    @comment.destroy
    
  end
  private 
  
  def book_comments_params
    params.require(:book_comment).permit(:user_id, :book_id, :comment)
  end
  
  
  
end
