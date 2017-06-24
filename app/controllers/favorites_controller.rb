class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.addfavorite(micropost)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to users_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.removefavorite(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to users_url
  end
end
