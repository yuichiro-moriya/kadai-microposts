class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.addfavorite(micropost)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to favoritings_user_url(current_user.id)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.removefavorite(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to favoritings_user_url(current_user.id)
  end
end
