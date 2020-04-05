class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@comment = BookComment.new(book_comment_params)
		@comment.user_id = current_user.id
		@comment.book_id = @book.id
		if @comment.save
		   flash[:success] = "コメントしました"
		   redirect_back(fallback_location: root_path)
		else
		   flash[:danger] = "コメントに失敗しました"
		   redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		# @book = Book.find(params[:book_id])
		comment = BookComment.find(params[:book_id])
		comment.destroy
		redirect_back(fallback_location: root_path)
	end

    private
    def book_comment_params
	    params.require(:book_comment).permit(:comment)
    end
end