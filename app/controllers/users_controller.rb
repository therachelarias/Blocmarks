class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = Like.where(user_id: current_user.id)
  end
end
