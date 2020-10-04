class UsersController < ApplicationController
  # 一覧表示機能
  def index
    @users = User.all
  end

  # 新規投稿機能
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  # 編集機能
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to action: :index
  end

  # 削除機能
  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to action: :index
  end

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end
end
