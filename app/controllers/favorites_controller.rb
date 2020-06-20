class FavoritesController < ApplicationController
  
  def create
    # @shoe = Shoe.find(params[:shoe_id])
    @favorite = current_user.favorites.create(shoe_id: params[:shoe_id])
    redirect_back(fallback_location: root_path)  #いいね時前画面に戻る(エラー時のルートパス)
  end

  def destroy
    @shoe = Shoe.find(params[:shoe_id])
    @favorite = current_user.favorites.find_by(shoe_id: @shoe.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)  #いいね時前画面に戻る(エラー時のルートパス)
  end
end
