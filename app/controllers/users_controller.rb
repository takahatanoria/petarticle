class UsersController < ApplicationController
  before_action :move_to_index, except: [:index]


  def show
    if  user_signed_in?
      @user = User.find(params[:id])
      @user_articles= Article.where(user_id: current_user.id).includes(:user).page(params[:page]).per(5).order("created_at DESC")
      @name = current_user.name
    else
      redirect_to root_path
    end
  end

  def edit
    if  user_signed_in? && @article.user_id == current_user.id
    else
      redirect_to root_path unless @article.user_id == current_user.id
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
