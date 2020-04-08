class RelationshipsController < ApplicationController


	def create
		user = User.find(params[:follow_id])
		following = current_user.follow(user)
		if following.save
			flash[:success] = 'ユーザーをフォローしました'
			redirect_back(fallback_location: root_path)
		else
			flash.now[:alert] = 'ユーザーのフォローに失敗しました'
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		user = User.find(params[:relationship][:follow_id])
		following = current_user.user.unfollow(user)
		if following.destroy
			flash[:success] =　'ユーザーのフォローを解除しました'
			redirect_back(fallback_location: root_path)
		else
			flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
			redirect_back(fallback_location: root_path)
		end
	end

	def follower
		user = User.find(params[:user_id])
		@users = user.following_user
	end

    def followed
        user = User.find(params[:user_id])
        @users = user.follower_user
    end
end
