class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :book
	# validate_uniqueness_of :book_id, scope: :user_id
end
