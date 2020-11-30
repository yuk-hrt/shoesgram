class ShoesController < ApplicationController
  before_action :set_shoe, only: [:edit, :show]

  def index
    @shoes = Shoe.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @shoe = Shoe.new
  end

  def create
    Shoe.create(shoe_params)
  end

  def destroy
    shoe = Shoe.find(params[:id])
    shoe.destroy
  end

  def edit
    if @shoe.user != current_user
      redirect_to shoes_path
    end
  end

  def update
    shoe = Shoe.find(params[:id])
    shoe.update(shoe_params)
  end

  def show
    @comment = Comment.new
    @comments = @shoe.comments.includes(:user)
  end

  def search
    @shoes = Shoe.search(params[:keyword]).order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def shoe_params
    params.require(:shoe).permit(:brand, :image, :text).merge(user_id: current_user.id)
  end

  def set_shoe
    @shoe = Shoe.find(params[:id])
  end

end
