class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @shoes = @user.shoes.order("created_at DESC")
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
  end

end
