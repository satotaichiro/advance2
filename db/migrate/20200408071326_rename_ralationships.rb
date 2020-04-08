class RenameRalationships < ActiveRecord::Migration[5.2]
  def change
  	rename_column :relationships, :user_id, :follower_id
  	rename_column :relationships, :follow_id, :followed_id
  end
end
