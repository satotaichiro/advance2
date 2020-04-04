class FavoritesController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@favorite = current_user.favorites.create(book_id: params[:book_id])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@book = Book.find(params[:book_id])
		@favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
		@favorite.destroy
		redirect_back(fallback_location: root_path)
	end
end